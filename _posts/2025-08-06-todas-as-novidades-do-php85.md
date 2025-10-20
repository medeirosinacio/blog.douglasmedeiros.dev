---
layout: blog-post
title: "Todas as Novidades do PHP 8.5"
date: 2025-08-06
permalink: /artigos/:categories/todas-as-novidades-do-php85
categories:
  - php
tags: [ php8.5, array_first, array_last, curl_multi, get_error_handler, novidades, stack-traces, php, desenvolvimento, programação ]
image: /assets/images/posts/php85.jpg
description: "PHP 8.5 chega em novembro com funcionalidades que você vai usar todos os dias: array_first(), array_last(), pipe operator, debugging aprimorado e muito mais. Descubra o que muda e por que atualizar seus projetos agora vai te poupar dor de cabeça depois."
---

O PHP 8.5 está com lançamento previsto para 20 de novembro de 2025, ele representa a última versão incremental antes do
PHP 9.0. Embora não traga mudanças revolucionárias como o PHP 8.0, esta versão foca em resolver limitações históricas e
melhorar a experiência do desenvolvedor com funcionalidades que a comunidade solicita há anos.

Esta versão consolida tendências iniciadas nas versões anteriores: melhor introspecção do sistema, sintaxe mais
expressiva e debugging aprimorado. As mudanças abordam lacunas específicas da linguagem, desde a ausência de funções
básicas para arrays até limitações em stack traces de erros fatais, que desenvolvedores contornavam com workarounds.

O timing da versão 8.5 é estratégico. Como última release antes do PHP 9.0, ela serve como uma ponte para preparar
códigos e práticas para as mudanças mais substanciais que virão. Algumas Depreciado incluídas aqui antecipam removals
que acontecerão no PHP 9, dando tempo para adaptação.

## Índice

1. [Novas funções de array](#novas-funções-de-array)
2. [Pipe Operator](#pipe-operator)
3. [Atributo #[\NoDiscard]](#atributo-nodiscard)
4. [Final Property Promotion](#final-property-promotion)
5. [Attributes on Constants](#attributes-on-constants)
6. [Error Backtraces aprimorado](#error-backtraces-aprimorado)
7. [Funções de introspecção](#funções-de-introspecção)
8. [Asymmetric Visibility para propriedades estáticas](#asymmetric-visibility-para-propriedades-estáticas)
9. [Clone com propriedades](#clone-com-propriedades)
10. [Closures em expressões constantes](#closures-em-expressões-constantes)
11. [Melhorias no cURL](#melhorias-no-curl)
12. [Nova função grapheme_levenshtein](#nova-função-grapheme_levenshtein)
13. [Opção INI diff](#opção-ini-diff)
14. [Directory class não pode ser instanciada](#directory-class-não-pode-ser-instanciada)
15. [First Class Callables em expressões constantes](#first-class-callables-em-expressões-constantes)
16. [OPcache não-opcional](#opcache-não-opcional)
17. [Constante PHP_BUILD_DATE](#constante-php_build_date)
18. [Nova Funcionalidade RTL](#nova-funcionalidade-rtl)
19. [Nova Classe IntlListFormatter](#nova-classe-intllistformatter)
20. [Depreciado](#depreciado)

## O que vem por aí?

### Novas funções de array

> RFC: [array_first() and array_last()](https://wiki.php.net/rfc/array_first_last)

PHP 8.5 inclui as funções `array_first()` e `array_last()` que resolvem um problema que enfrentamos constantemente.
Quantas vezes você já escreveu `reset($array)` ou `$array[array_key_first($array)]` só para pegar o primeiro elemento?

O problema com `reset()` é que ele modifica o ponteiro interno do array, o que pode causar bugs sutis quando outras
partes do código dependem da posição atual. Com `array_key_first()` você tem código verboso e difícil de ler.

As novas funções são intuitivas, não têm side effects e funcionam consistentemente com arrays vazios.

```php
// Antes
$products = ['laptop', 'mouse', 'keyboard'];
$first = reset($products); // modifica ponteiro interno
$first = $products[array_key_first($products)]; // verboso

// Agora
$first = array_first($products); // 'laptop'
$last = array_last($products);   // 'keyboard'
```

### Pipe Operator

> RFC: [Pipe operator v3](https://wiki.php.net/rfc/pipe-operator-v3)

O pipe operator (`|>`) implementa programação funcional em estilo pipeline, eliminando variáveis intermediárias e
aninhamento de funções.

O operador passa o resultado da expressão à esquerda como primeiro argumento da função à direita, permitindo
encadeamento linear de transformações. Isso resolve problemas comuns como múltiplas variáveis temporárias ou chamadas de
função aninhadas que prejudicam a legibilidade. É útil em processamento de dados onde você aplica uma sequência de
transformações, tornando o fluxo de dados explícito.

A sintaxe é inspirada em linguagens funcionais como F## e Elixir, e em shells Unix com pipes.

```php
// Antes
$fullName = 'Fred Flintstone';
$words = explode(' ', $fullName);
$joined = implode('_', $words);
$result = strtolower($joined);

// Agora
$result = 'Fred Flintstone'
    |> explode(' ', ...)
    |> implode('_', ...)
    |> strtolower(...);
    
// $result === 'fred_flintstone'
```

### Atributo #[\NoDiscard]

> RFC: [Marking return values as important](https://wiki.php.net/rfc/marking_return_value_as_important)

PHP 8.5 introduz o atributo `#[\NoDiscard]` para prevenir bugs silenciosos causados por valores de retorno ignorados.

Funções que retornam informações críticas sobre sucesso/falha ou dados importantes podem ter seus retornos ignorados
acidentalmente, causando bugs difíceis de detectar. O atributo marca funções cujo valor de retorno é obrigatório,
emitindo `warnings` quando ignorado. Isso é útil em interfaces onde o retorno indica status de operação, validação de
dados ou resultados que devem ser processados. A funcionalidade ajuda a tornar contratos de API mais explícitos e
previne uso incorreto de funções críticas.

```php
#[\NoDiscard("O resultado da operação é importante")]
function calculateDiscount(float $price): float {
    return $price * 0.9;
}

// Warning: return value expected to be consumed
calculateDiscount(150.0);

// Uso correto
$discountedPrice = calculateDiscount(150.0);
```

### Final Property Promotion

> RFC: [Final Property Promotion](https://wiki.php.net/rfc/final_promotion)

PHP 8.5 permite usar a palavra-chave `final` em `constructor property promotion`, fechando uma lacuna na funcionalidade.

Quando você marca uma propriedade como `final`, está dizendo que classes filhas não podem redefinir essa propriedade.
Isso é útil para criar contratos mais rígidos em hierarquias de classes, garantindo que certas propriedades fundamentais
não sejam alteradas por herança. Antes do PHP 8.5, você não conseguia fazer isso diretamente na sintaxe de
`property promotion,` tinha que declarar a propriedade separadamente.

```php
class User {
    public function __construct(
        final string $id,  // não pode ser sobrescrito
        public string $name
    ) {}
}

class AdminUser extends User {
    public function __construct(
        string $id,
        string $name,
        // final string $id // ERRO! Não pode sobrescrever
        public array $permissions = []
    ) {
        parent::__construct($id, $name);
    }
}
```

### Attributes on Constants

> RFC: [Attributes on Constants](https://wiki.php.net/rfc/attributes-on-constants)

PHP 8.5 expande o sistema de atributos para incluir constantes globais, completando a cobertura iniciada em versões
anteriores.

Atributos são metadados que você pode anexar a código, como anotações que descrevem comportamentos ou propriedades
especiais. Até agora, você podia usar em classes, métodos e propriedades, mas não em constantes globais (fora de
classes). Isso era uma limitação inconsistente. Agora você pode marcar constantes como depreciadas, documentar seu uso,
ou adicionar qualquer metadado necessário. É útil para bibliotecas que querem fornecer informações ricas sobre suas
constantes públicas.

```php
#[\Deprecated(reason: 'Use NEW_API_URL instead', since: '8.5')]
const OLD_API_URL = 'https://old-api.example.com';

const NEW_API_URL = 'https://api.example.com';

// IDEs e ferramentas podem avisar sobre uso da constante obsoleta
function fetchData() {
    $data = file_get_contents(OLD_API_URL); // Warning em IDEs
    return $data;
}
```

### Error Backtraces aprimorado

> RFC: [Error Backtraces v2](https://wiki.php.net/rfc/error_backtraces_v2)

PHP 8.5 adiciona stack traces automáticos em erros fatais através da nova configuração INI `fatal_error_backtraces`,
resolvendo uma limitação histórica do debugging em PHP.

Erros fatais como timeout de execução, esgotamento de memória ou chamadas para métodos inexistentes mostravam apenas
onde o erro ocorreu, sem contexto de como a execução chegou até ali. Em aplicações com múltiplas camadas de abstração,
isso tornava o debugging difícil.

A nova configuração adiciona o stack trace completo ao erro, mostrando a sequência de chamadas que levou ao problema. O
backtrace respeita configurações de privacidade (como `SensitiveParameter`) e está disponível programaticamente via
`error_get_last()` em shutdown functions. Isso elimina a necessidade de adicionar `debug_backtrace()` manualmente ou
usar ferramentas externas para rastrear a origem de erros fatais.

```php
function processOrder($order) {
    validatePayment($order->payment);
}

function validatePayment($payment) {
    $payment->validateCard(); // método inexistente
}

// Antes: Fatal error in validatePayment()

// Agora com fatal_error_backtraces=On:
// Fatal error: Call to undefined method Payment::validateCard()
// Stack trace:
// #0 processOrder($order)
// #1 validatePayment($payment)
// #2 {main}
```

### Funções de introspecção

> RFC: [Add get_error_handler(), get_exception_handler() functions](https://wiki.php.net/rfc/get-error-exception-handler)

PHP 8.5 adiciona `get_error_handler()` e `get_exception_handler()`, resolvendo um problema de introspecção que existe há
anos.

Quando você define handlers customizados para erros e exceções com `set_error_handler()` e `set_exception_handler()`,
não havia uma forma direta de descobrir qual handler estava ativo. Isso criava problemas para bibliotecas que precisavam
salvar e restaurar handlers, ou para debugging quando algo não funcionava como esperado. O workaround era definir um
handler temporário só para pegar o anterior, uma solução inadequada. Agora você pode inspecionar diretamente o estado
atual do sistema de tratamento de erros.

```php
// Salvando handler antes de sobrescrever
$originalHandler = get_exception_handler();

set_exception_handler(function($e) {
    logCriticalError($e);
});

// Processar operações...

// Restaurar handler original
set_exception_handler($originalHandler);
```

### Asymmetric Visibility para propriedades estáticas

> RFC: [Asymmetric Visibility for Static Properties](https://wiki.php.net/rfc/static-aviz)

PHP 8.5 estende asymmetric visibility para propriedades estáticas, completando a funcionalidade introduzida no PHP 8.4
para propriedades de instância.

Asymmetric visibility resolve um problema comum em orientação a objetos: como permitir leitura pública de uma
propriedade mas restringir quem pode modificá-la. Por exemplo, um contador global que todos podem ler mas só a classe
pode incrementar. Antes você precisava de getters/setters ou propriedades privadas com métodos públicos. Com asymmetric
visibility, você declara `public private(set)` indicando "público para ler, privado para escrever". A extensão para
propriedades estáticas traz consistência e permite padrões como singletons ou configurações globais.

```php
class Configuration {
    public private(set) static array $settings = [];

    public static function updateSettings(array $new): void {
        self::$settings = $new; // permitido internamente
    }
}

echo Configuration::$settings['env']; // leitura OK

// Configuration::$settings = []; // ERRO! escrita privada
```

### Clone com propriedades

> RFC: [Clone with V2](https://wiki.php.net/rfc/clone_with_v2)

PHP 8.5 resolve um problema específico com objetos imutáveis através de uma nova sintaxe funcional para clonagem:
`clone($objeto, ['propriedade' => $valor])`.

Com propriedades `readonly`, você não pode modificá-las após a criação do objeto. Isso é ótimo para imutabilidade, mas
cria um dilema: como criar uma versão modificada do objeto? Antes você precisava de métodos `withProperty()` verbosos ou
construtores complexos.

A nova sintaxe permite clonar e modificar em um passo só, mesmo com propriedades readonly. O método mágico `__clone()` é
chamado antes das novas propriedades serem definidas, e regras de visibilidade são respeitadas. A função `clone` também
pode ser usada como callable, permitindo `array_map('clone', $arrayOfObjects)` para clonar arrays de objetos.

```php
readonly class User {
    public function __construct(
        public string $name,
        public string $email
    ) {}
}

$user = new User('Douglas', 'old@email.com');

// Nova sintaxe funcional para clone
$updatedUser = clone($user, ['email' => 'new@email.com']);

// Clone tradicional ainda funciona
$copy = clone $user;

// Como callable em array operations
$users = [new User('A', 'a@test.com'), new User('B', 'b@test.com')];
$clones = array_map('clone', $users);

```

### Closures em expressões constantes

> RFC: [Support Closures in constant expressions](https://wiki.php.net/rfc/closures_in_const_expr)

PHP 8.5 permite usar closures estáticos em contextos que exigem valores determinísticos em tempo de compilação.

Expressões constantes são valores que devem ser conhecidos durante a compilação, não em runtime, como valores padrão de
parâmetros, constantes de classe ou argumentos de atributos. A limitação anterior obrigava uso de valores primitivos ou
workarounds com verificações `null`. Agora closures estáticos (sem captura de variáveis ou dependência de `$this`) podem
ser usados nesses contextos, permitindo callbacks padrão mais elegantes e eliminando boilerplate de validação. Isso é
valioso para bibliotecas que precisam de comportamentos padrão configuráveis ou sistemas de validação declarativa.

```php
// Callbacks padrão em funções
function filterArray(
    array $array,
    Closure $callback = static function($item) { return !empty($item); }
) {
    return array_filter($array, $callback);
}

// Em atributos
final class Locale {
    #[Validator\Custom(static function(string $code): bool {
        return preg_match('/^[a-z]{2}$/', $code);
    })]
    public string $languageCode;
}
```

### Melhorias no cURL

> RFC: [Persistent curl share handle improvement](https://wiki.php.net/rfc/curl_share_persistence_improvement)

PHP 8.5 introduz `curl_share_init_persistent()` para criar handles de compartilhamento cURL mais seguros.

cURL share handles permitem que múltiplas requisições compartilhem dados como cache DNS para melhor performance. A
versão persistente permite reutilizar esses handles entre diferentes requisições PHP. O problema da implementação
anterior era que você precisava gerenciar IDs persistentes manualmente e havia riscos de vazamento de dados sensíveis
como cookies. A nova função gerencia isso automaticamente baseado nas opções que você passa, eliminando a necessidade de
IDs customizados e reduzindo riscos de segurança.

```php
// Inspecionar handles ativos
$multiHandle = curl_multi_init();
// ... adicionar handles

$activeHandles = curl_multi_get_handles($multiHandle);
foreach ($activeHandles as $handle) {
    $info = curl_getinfo($handle);
    echo "Status: {$info['http_code']}, URL: {$info['url']}\n";
}

// Handles persistentes seguros
$options = [CURL_LOCK_DATA_DNS];
$shareHandle = curl_share_init_persistent($options);
curl_setopt($ch, CURLOPT_SHARE, $shareHandle);
```

### Nova função grapheme_levenshtein

> RFC: [Grapheme cluster for levenshtein, grapheme_levenshtein function](https://wiki.php.net/rfc/grapheme_levenshtein)

PHP 8.5 adiciona `grapheme_levenshtein()`, uma implementação da distância Levenshtein que funciona corretamente com
caracteres Unicode complexos.

A distância Levenshtein calcula o número mínimo de edições (inserção, remoção, substituição) necessárias para
transformar uma string em outra. É usada em correção ortográfica, busca aproximada e sistemas de sugestão. As funções
existentes (`levenshtein()` e `mb_levenshtein()`) operam em bytes ou code points Unicode, o que gera resultados
incorretos para caracteres compostos como letras com acentuação.

```php
// Caracteres visualmente idênticos mas codificados diferente
$str1 = "\u{0065}\u{0301}"; // e + acento combinado
$str2 = "\u{00e9}";         // é como caractere único

echo levenshtein($str1, $str2);          // > 0 (incorreto)
echo grapheme_levenshtein($str1, $str2); // 0 (correto)
```

### Opção INI diff

> PR: [Print non-default INI settings for --ini=diff](https://github.com/php/php-src/pull/17762)

PHP 8.5 introduz `php --ini=diff`, uma ferramenta simples mas muito útil para debugging de configuração.

Quando você tem problemas em produção, uma das primeiras coisas que verifica são as configurações PHP. Mas comparar
todas as configurações ativas com os padrões é tedioso e propenso a erro. A nova opção mostra apenas as configurações
que foram modificadas dos valores padrão, destacando exatamente o que foi customizado no seu ambiente. Isso é valioso ao
comparar ambientes (dev vs prod), debuggar problemas de performance, ou auditando configurações de segurança.

```php
php --ini=diff

## Output:
Non-default INI settings:
memory_limit: "128M" -> "512M"
display_errors: "1" -> ""
date.timezone: "UTC" -> "Europe/Amsterdam"
```

### Directory class não pode ser instanciada

> RFC: [Change Directory class to behave like a resource object](https://wiki.php.net/rfc/directory-opaque-object)

O PHP 8.5 introduz uma mudança significativa na classe `Directory`, transformando-a em um objeto de recurso estrito e
não modificável para corrigir problemas históricos de uso inadequado. Anteriormente, a classe `Directory,` usada para
representar identificadores de diretório criados pela função `dir()` comportava-se como uma classe comum, o que permitia
a criação de objetos inválidos através de `new Directory()` e consequentemente levava a bugs e uso indevido. Com a nova
implementação, a classe torna-se final (não pode ser herdada), impede a instanciação direta (apenas `dir()` pode criar
instâncias válidas), bloqueia a clonagem e serialização de objetos, e não permite a adição de propriedades dinâmicas em
tempo de execução.

Essas mudanças fazem com que tentativas de usar `new Directory()` resultem em erro, garantindo que apenas objetos
Directory válidos sejam criados através do método apropriado, tornando o comportamento mais seguro, previsível e
consistente com outros recursos do PHP.

```php
// Erro: não pode instanciar diretamente
$dir = new Directory(); // Throws Error

// Forma correta
$dir = dir('/tmp');

// Não pode clonar, estender ou serializar
// clone $dir; // Error
// class MyDir extends Directory {} // Error
```

### First Class Callables em expressões constantes

> RFC: [First Class Callables in constant expressions](https://wiki.php.net/rfc/fcc_in_const_expr)

PHP 8.5 estende first-class callables (FCCs) para funcionarem em mais lugares do código, completando uma funcionalidade
iniciada no PHP 8.1.

First-class callables são uma forma elegante de referenciar funções usando a sintaxe `função(...)`. Por exemplo,
`strlen(...)` cria um callable para a função strlen. Até agora, você só podia usar isso em contextos de runtime, mas não
em "expressões constantes" como valores padrão, constantes ou atributos. A limitação era inconsistente e forçava
workarounds. Agora você pode definir callables reutilizáveis como constantes, usar em atributos para metaprogramação, ou
como valores padrão em funções, tornando o código mais expressivo e DRY.

```php
// Callables como constantes
const MY_STRLEN = strlen(...);
const MY_METHOD = MyClass::myMethod(...);

// Em atributos
#[ProcessWith(trim(...))]
class DataProcessor {}

// Uso
$length = MY_STRLEN("hello"); // 5
```

### OPcache não-opcional

> RFC: [Make OPcache a non-optional part of PHP](https://wiki.php.net/rfc/make_opcache_required)

PHP 8.5 integra OPcache como parte obrigatória da linguagem, eliminando a necessidade de verificações condicionais.

OPcache é o sistema de cache de bytecode que melhora a performance do PHP compilando scripts uma vez e reutilizando o
resultado. Desde PHP 5.5 ele está disponível, mas era opcional, você tinha que compilar PHP com suporte específico. Isso
criava inconsistências: código que funcionava em um servidor podia quebrar em outro. Agora está sempre presente,
permitindo que você use funções `opcache_*` sem verificar se existem. Isso simplifica código de monitoramento e
debugging.

```php
// PHP 8.5+: sempre disponível
$status = opcache_get_status(false);
$scripts = $status['scripts']['num_cached_scripts'] ?? 0;

echo "Scripts em cache: {$scripts}";

// Não precisa mais verificar
// if (function_exists('opcache_get_status')) { ... }
```

### **Constante PHP_BUILD_DATE**

> PR: [Add PHP_BUILD_DATE constant](https://github.com/php/php-src/commit/6dec6a6dbaa14ef5ebd998f9ed75919c6dd83661#diff-878e00d3056c40c194f0d6da791ec86c5c169272cb5aeb86ab95b0b9af0e5768R8)

O PHP 8.5 introduz a nova constante `PHP_BUILD_DATE` que fornece diretamente a data e hora de quando o binário do PHP
foi compilado, eliminando a necessidade de extrair essa informação da função `phpinfo()` de forma complexa. A constante
retorna o valor no formato "M j Y H:i:s" (exemplo: "Sep 16 2025 10:44:26") e pode ser facilmente convertida para um
objeto `DateTimeImmutable` para manipulação de datas.

```php
// Acessar diretamente a data de build
echo PHP_BUILD_DATE;
// Output: Sep 16 2025 10:44:26

// Converter para objeto DateTime para manipulação
$dt = DateTimeImmutable::createFromFormat('M j Y H:i:s', PHP_BUILD_DATE);
echo $dt->format('Y-m-d'); // Output: 2025-09-16
echo $dt->format('U');     // Output: timestamp Unix
```

### Nova Funcionalidade RTL

> PR: [Intl: Add IntlListFormatter class](https://github.com/php/php-src/commit/3f7545245)

O PHP 8.5 introduz uma nova funcionalidade na extensão Intl para detectar se um idioma utiliza escrita da direita para a
esquerda (RTL - Right-to-Left). A função `locale_is_right_to_left()` e o método estático `Locale::isRightToLeft()`
recebem uma string de localidade e retornam um boolean indicando se o script é RTL. Esta funcionalidade utiliza dados
atualizados do ICU (International Components for Unicode) para identificar idiomas como árabe, hebraico, urdu, persa e
outros que são escritos da direita para a esquerda. A implementação é consistente com outras funções de localidade do
PHP, retornando `false` para locales inválidos ou vazios, e é especialmente útil para aplicações que precisam ajustar
layouts e direcionamento de texto baseado no idioma do usuário.

```php
// Usando a função global
locale_is_right_to_left('en');     // false (inglês)
locale_is_right_to_left('ar');     // true (árabe)

// Usando o método estático da classe Locale
Locale::isRightToLeft('ur');       // true (urdu)
Locale::isRightToLeft('pt-BR');    // false (português brasileiro)

// Exemplo prático: ajustando CSS baseado na direção do texto
function getCssDirection($locale) {
    return locale_is_right_to_left($locale) ? 'rtl' : 'ltr';
}

echo '<div dir="' . getCssDirection('ar-SA') . '">محتوى باللغة العربية</div>';
// Output: <div dir="rtl">محتوى باللغة العربية</div>
```

### Nova Classe IntlListFormatter

> PR: [Intl: Add IntlListFormatter class](https://github.com/php/php-src/commit/3f7545245)

O PHP 8.5 introduz a classe `IntlListFormatter` na extensão Intl, que oferece formatação localizada de listas de forma
legível e culturalmente apropriada. Esta classe permite criar listas do tipo "e" (conjuntivas), "ou" (disjuntivas) ou de
unidades, respeitando as convenções linguísticas de cada locale.

A classe utiliza dados do ICU (International Components for Unicode) e segue os mesmos padrões de outras classes da
extensão Intl. É possível controlar tanto o tipo de lista quanto a largura da formatação - desde formato completo até
versões mais compactas e estreitas. A implementação é especialmente útil para aplicações internacionalizadas que
precisam exibir listas de itens de forma natural em diferentes idiomas, eliminando a necessidade de lógica manual de
formatação que pode não funcionar corretamente em todos os contextos culturais.

```php
// Formatação básica em diferentes idiomas
$formatter = new IntlListFormatter('en-US');
echo $formatter->format(['PHP', 'Python', 'JavaScript']);
// Output: "PHP, Python, and JavaScript"

$formatter = new IntlListFormatter('pt-BR');
echo $formatter->format(['PHP', 'Python', 'JavaScript']);
// Output: "PHP, Python e JavaScript"

// Diferentes tipos de listas
$formatter = new IntlListFormatter('en-US', IntlListFormatter::TYPE_OR);
echo $formatter->format(['PHP', 'Python', 'JavaScript']);
// Output: "PHP, Python or JavaScript"
```

### Depreciado

> RFC: [Deprecations for PHP 8.4](https://wiki.php.net/rfc/deprecations_php_8_4)

O PHP 8.5 traz a depreciação de práticas inseguras e a remoção de funcionalidades obsoletas. Para evitar problemas na
migração, revise a documentação oficial e atualize seu código conforme necessário.

```php
// Deprecated
mhash(...)
DOMImplementation::getFeature(...)
mysqli_ping(...)
class _NomeDaClasse{...}
new Directory(...)
...

// Non-canonical scalar type casts (boolean|double|integer|binary) deprecated
$int = (integer) '42';     // Deprecated: Non canonical cast (integer)
$float = (double) '3.14';  // Deprecated: Non canonical cast (double)
$bool = (boolean) 1;       // Deprecated: Non canonical cast (boolean)
$str = (binary) 'text';    // Deprecated: Non canonical cast (binary)

// Returning non-string values from a user output handler is deprecated
ob_start(function(string $buffer, int $phase) {
    return true;
});
```

## Conclusão

A cada nova versão do PHP, acumulamos débito técnico. Funcionalidades que não aproveitamos, melhorias de performance 
que deixamos para trás, vulnerabilidades corrigidas que continuamos expostos. Esse débito não some sozinho - ele se 
acumula até que uma atualização forçada se torna urgente e cara.

PHP 8.5 resolve problemas que você provavelmente já enfrentou: debugging complicado de erros fatais, código verboso 
para operações básicas em arrays, workarounds para funcionalidades que deveriam existir nativamente. Ao ignorar essas 
melhorias, continuamos pagando o custo dessas limitações no dia a dia.

A estratégia mais eficaz é reservar algumas horas a cada 2-3 meses para atualizar seus projetos com calma. Assim você 
ganha as funcionalidades, segurança e performance de forma gradual, sem pressa ou pressão. É infinitamente mais barato 
que esperar anos e enfrentar uma migração complexa depois.

> [!NOTE]
> Este conteúdo foi preparado para minha apresentação sobre PHP 8.5 e serve como material de 
> referência para desenvolvedores que querem se manter atualizados.

---

*Mantenha-se atualizado sobre as evoluções do PHP e compartilhe com sua equipe.*
