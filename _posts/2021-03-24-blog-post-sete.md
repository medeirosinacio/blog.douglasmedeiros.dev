---
layout: blog-post
date: 2021-03-24
permalink: /artigos/:categories/blog-post-oito
title: "Explorando o Windows Subsystem for Linux (WSL)"
categories:
  - tecnologia
tags:
  - WSL
  - Linux
  - Windows
image: posts/Blog-Cover-Image-Linux-Bash.jpg
introduction: "O Windows Subsystem for Linux (WSL) tem se tornado uma ferramenta essencial para desenvolvedores que desejam combinar a familiaridade do ambiente Linux com a robustez do sistema operacional Windows. Neste artigo, vamos explorar os benefícios, recursos e casos de uso do WSL. O Windows Subsystem for Linux (WSL) tem se tornado uma ferramenta essencial para desenvolvedores que desejam combinar a familiaridade do ambiente Linux com a robustez do sistema operacional Windows. Neste artigo, vamos explorar os benefícios, recursos e casos de uso do WSL."
author: Douglas Medeiros
author_title: Engenheiro de Software
---

O Windows Subsystem for Linux (WSL) tem se tornado uma ferramenta essencial para desenvolvedores que desejam combinar a
familiaridade do ambiente Linux com a robustez do sistema operacional Windows. Neste artigo, vamos explorar os
benefícios, recursos e casos de uso do WSL.

## **O que é o WSL?**

O Windows Subsystem for Linux é uma camada de compatibilidade para executar aplicativos binários do Linux diretamente no
Windows, sem a necessidade de uma máquina virtual separada. Ele permite que os desenvolvedores tenham acesso a um
ambiente Linux completo dentro do Windows, incluindo shell, utilitários e bibliotecas.

## Benefícios do WSL

- **Compatibilidade**: Com o WSL, os desenvolvedores podem executar aplicativos e ferramentas Linux diretamente no
  Windows, eliminando a necessidade de alternar entre sistemas operacionais ou configurar máquinas virtuais separadas.

- **Integração com o Windows**: O WSL se integra perfeitamente ao ambiente de trabalho do Windows, permitindo o uso de
  ferramentas de desenvolvimento e recursos do Windows junto com aplicativos Linux.

- **Desempenho**: Ao contrário das máquinas virtuais tradicionais, o WSL aproveita o kernel do Windows para executar
  aplicativos Linux, resultando em um desempenho significativamente melhor e tempos de inicialização mais rápidos.

## Casos de Uso do WSL

```php
class WSL {
    public function __construct() {
        echo "Explorando o Windows Subsystem for Linux (WSL)";
    }
}

```

- **Desenvolvimento de Software**: O WSL é amplamente utilizado por desenvolvedores para executar ferramentas e
  ambientes de desenvolvimento baseados em Linux diretamente no Windows.

- **Administração de Sistemas**: Administradores de sistemas podem usar o WSL para executar scripts e comandos do Linux
  em máquinas Windows, facilitando tarefas de automação e gerenciamento de servidores.

- **Ensino e Aprendizado**: O WSL é uma excelente ferramenta para estudantes e educadores que desejam aprender sobre o
  Linux sem precisar instalar um sistema operacional Linux separado.

# Conclusão

## Conclusão

### Conclusão

#### Conclusão

##### Conclusão

| Conclusão | Conclusão | Conclusão |
|-----------|-----------|-----------|
| Conclusão | Conclusão | Conclusão |
| Conclusão | Conclusão | Conclusão |
| Conclusão | Conclusão | Conclusão |

O Windows Subsystem for Linux (WSL) é uma ferramenta poderosa que proporciona aos desenvolvedores a flexibilidade de
trabalhar com ambientes Linux e Windows em conjunto. Com seus benefícios de compatibilidade, integração e desempenho, o
WSL continua a ganhar popularidade na comunidade de desenvolvedores e administradores de sistemas. Se você ainda não
explorou as possibilidades do WSL, agora é o momento perfeito para começar a aproveitar seus recursos e melhorar sua
produtividade no desenvolvimento de software.

```php
<?php

namespace App\Infrastructure\Repositories\Task;

use App\Application\Traits\Repository\Statuses;
use App\Domain\Contracts\BaseRepository;
use App\Domain\Contracts\Task\TaskDataRepositoryInterface;
use App\Domain\Contracts\Task\TaskRepositoryInterface;
use App\Domain\Contracts\Task\TaskType;
use App\Domain\Enums\Status;
use App\Domain\Enums\Task\Types;
use App\Domain\Models\Collection\Files;
use App\Domain\Models\File;
use App\Domain\Models\Task\Task;
use App\Domain\Models\Task\TaskError;
use App\Domain\Models\Task\TaskTimeline;
use App\Domain\ValueObjects\TaskData;
use App\Facades\Setting;
use Dump\Patterns\Strategy\Interfaces\StrategyType;
use Illuminate\Database\Eloquent\Collection as CollectionEloquent;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Collection;

class TaskRepository extends BaseRepository implements TaskRepositoryInterface
{
    use Statuses;

    const MODEL = Task::class;

    public function __construct(protected TaskDataRepositoryInterface $taskDataRepository)
    {
    }

    public function create(Task $task): bool
    {
        return $task->saveOrFail();
    }

    public function saveData(Task $task, TaskData $data): bool
    {
        $task->data->merge($data);

        return $task->updateOrFail();
    }

    public function allUnfinished(?int $limit = null, ?Status $status = null): Collection|CollectionEloquent
    {
        return $this->query()
            ->where(['finished' => false])
            ->where(is_null($status) ? [] : ['status_id' => $status])
            ->whereNotIn(
                'id',
                function (Builder $query) use ($limit) {
                    $query->select('t1.id')
                        ->from('tasks as t1')
                        ->join('tasks as t2', fn ($join) => $join->on('t2.parent_id', '=', 't1.id'))
                        ->whereNull('t1.parent_id')
                        ->where('t2.finished', '=', false)
                        ->orderBy('t1.updated_at')
                        ->limit($limit);
                }
            )
            ->orderBy('updated_at')
            ->limit($limit)
            ->lockForUpdate()
            ->get();
    }

    public function getTasksPendentToRoutine(?int $limit = null, ?Status $status = null): Collection|CollectionEloquent
    {
        return $this->query()
            ->where(['finished' => false])
            ->where(is_null($status) ? [] : ['status_id' => $status])
            ->where(function ($query) {
                $query->where('routine_executed_at', '<=', now()->subMinutes(Setting::taskRoutineAttemptTime()))
                    ->orWhereNull('routine_executed_at');
            })
            ->whereNotIn(
                'id',
                function (Builder $query) use ($limit) {
                    $query->select('t1.id')
                        ->from('tasks as t1')
                        ->join('tasks as t2', fn ($join) => $join->on('t2.parent_id', '=', 't1.id'))
                        ->whereNull('t1.parent_id')
                        ->where('t2.finished', '=', false)
                        ->whereNull(['t1.deleted_at', 't2.deleted_at'])
                        ->orderBy('t1.routine_executed_at')
                        ->limit($limit);
                }
            )
            ->whereNull('deleted_at')
            ->orderBy('routine_executed_at')
            ->limit($limit)
            ->lockForUpdate()
            ->get();
    }

    public function allParentsUnfinished(array $where = []): Collection|CollectionEloquent
    {
        return $this->query()->where(['finished' => false, 'parent_id' => null, ...$where])->get();
    }

    public function allParentsFinished(array $where = []): Collection|CollectionEloquent
    {
        return $this->query()->where(['finished' => true, 'parent_id' => null, ...$where])->get();
    }

    public function getSubtasks(Task $task): Collection|CollectionEloquent
    {
        return $this->query()->where(['parent_id' => $task->id])->get();
    }

    public function getSubtasksNotFinished(Task $task): Collection|CollectionEloquent
    {
        return $this->query()->where(['parent_id' => $task->id, 'finished' => false])->lockForUpdate()->get();
    }

    public function getSubtasksFinished(Task $task): Collection|CollectionEloquent
    {
        return $this->query()->where(['parent_id' => $task->id, 'finished' => true])->get();
    }

    public function getSubTask(Types $type, Task $task): ?Task
    {
        $model = $this->query()->where(['parent_id' => $task->id, 'type_id' => $type])->first();

        return $model instanceof Task ? $model : null;
    }

    public function addAttempt(
        Task $task,
        ?TaskError $error = null,
        bool $setStatusError = false
    ): bool {
        $task->error_id = $error->save() ? $error->id : null;
        $task->attempts += 1;
        $task->status_id = $setStatusError ? Status::ERROR->value : $task->status()?->value;

        return $task->save();
    }

    public function getNextPending(TaskType|StrategyType $type): ?Task
    {
        return $this->getNextPendingForTypes($type);
    }

    public function getNextPendingForTypes(TaskType|StrategyType ...$types): ?Task
    {
        /** @var ?Task $task */
        $task = $this->query()
            ->where(['status_id' => Status::PENDING])
            ->whereIn('type_id', $types)
            ->orderByRaw($this->createOrderByTypesClause($types))
            ->orderBy('updated_at')
            ->lockForUpdate()
            ->first();

        return $task;
    }

    public function addFile(File $taskFile, Task $task): bool
    {
        return !empty($task->files()->save($taskFile));
    }

    public function addFiles(Files|File $taskFiles, Task $task): bool
    {
        $taskFiles = instance_of($taskFiles, File::class) ?
            app(Files::class, ['attributes' => [$taskFiles]]) :
            $taskFiles;

        foreach ($taskFiles->getIterator() as $taskFile) {                                       // @phpstan-ignore-line
            if (is_false($this->addFile($taskFile, $task))) {
                return false;
            }
        }

        return true;
    }

    public function deleteAllFiles(Task $task): void
    {
        $task->files()->delete();
    }

    public function deleteAllData(Task $task): void
    {
        $task->data->delete();
    }

    public function deleteAllTasksFrom(Task $task): void
    {
        $this->query()->where('id', $task->main()->id)
            ->orWhere('parent_id', $task->main()->id)->delete();
    }

    public function restoreFilesFromIds(array $ids): void
    {
        $filesModel = $this->model()->files()->getRelated();                                     // @phpstan-ignore-line
        $filesModel->withTrashed()->whereIn('id', $ids)->update(['deleted_at' => null]);
    }

    public function getTrashedTask(int $id): ?Task
    {
        return $this->query()->withTrashed()->where('id', $id)->first();                         // @phpstan-ignore-line
    }

    public function delete(Task $task): bool
    {
        return $task->delete();
    }

    /**
     * @see https://stackoverflow.com/questions/68777281/laravel-eloquent-order-by-specific-value-with-postresql-database
     */
    private function createOrderByTypesClause(array $types): string
    {
        $idsTypesClause = '';
        foreach ($types as $key => $type) {
            $typeId = $type->value;
            $order = ++$key;
            $idsTypesClause .= " WHEN type_id={$typeId}  THEN {$order} ";
        }

        return sprintf('CASE %s END', $idsTypesClause);
    }

    public function getLatestTimelineRecords(int $amount, Task $task): Collection|CollectionEloquent
    {
        return TaskTimeline::where('task_id', $task->id)
            ->limit($amount)
            ->orderByDesc('created_at')
            ->orderByDesc('id')
            ->get();
    }

    public function getFirstTimelineRecord(Task $task): TaskTimeline
    {
        return TaskTimeline::where('task_id', $task->id)
            ->orderBy('id')
            ->first();
    }

    public function findTimelineFromTask(Task $task, int $timelineId): TaskTimeline
    {
        return $task->timeline->where('id', $timelineId)->first();
    }

    public function findByUuids(array $tasksUuid): Collection|CollectionEloquent
    {
        return $this->query()->whereIn('uuid', $tasksUuid)->get();
    }

    public function getLatestErrors(Task $task): array
    {
        $lastStepWithoutErrorId = TaskTimeline::query()
            ->select('id')
            ->where('task_id', $task->id)
            ->where('status_id', '!=', Status::ERROR)
            ->orderByDesc('id')
            ->first()->id;

        $tasksTimelineWithError = TaskTimeline::query()
            ->select('error_id')
            ->where('id', '>', $lastStepWithoutErrorId)
            ->where('task_id', $task->id)
            ->where('status_id', Status::ERROR)
            ->get();

        if ($tasksTimelineWithError->isEmpty()) {
            return [];
        }

        $taskErrors = TaskError::select('message')->whereIn('id', $tasksTimelineWithError)->get();

        return $taskErrors->pluck('message')->toArray();
    }

    public function logTimeline(Task $task, string|\Stringable|\BackedEnum $message = ''): bool
    {
        $message = !empty($message) ? getVal($message) : $task->message;
        $task->message = '';

        return TaskTimeline::create([
            ...$task->toArrayExcept(['uuid', 'uiid']),
            'task_id' => $task->main()->id,
            'data' => $task->data->toArray(),
            'files' => Task::find($task->id)->files->map(fn ($taskFile) => [
                'id' => $taskFile->id,
                'name' => $taskFile->name,
                'sha256_hash' => $taskFile->sha256_hash,
            ]),
            'context' => $task->main()->getContext(),
            'message' => $message,
            'created_at' => $task->updated_at ?? now(),
        ])->saveOrFail();
    }

    public function updateRoutineExecutedDate(Task $task): void
    {
        \DB::table($task->getTable())->where('id', $task->id)->update(['routine_executed_at' => now()]);
    }
}

```

1. **Benefícios do WSL**
2. **Casos de Uso do WSL**
    3. **Desenvolvimento de Software**

> dasdasd

> WARNING: This is a warning.
>

```shell
This is a note.
```

> [NOTE]
> Useful information that users should know, even when skimming content.

<span data-type="note">


> Useful information that users should know, even when skimming content.


</span>


> [!NOTE]  
> Highlights information that users should take into account, even when skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]  
> Crucial information necessary for users to succeed.

> [!WARNING]  
> Critical content demanding immediate user attention due to potential risks.

> [!CAUTION]
> Negative potential consequences of an action.
