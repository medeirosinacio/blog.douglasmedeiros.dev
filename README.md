# Douglas Medeiros Blog

###### my personal space

> [blog.douglasmedeiros.dev](https://blog.douglasmedeiros.dev)

---

A personal blog focused on sharing technical articles, experiences, and reflections on technology. This blog is a space
for me to centralize my thoughts and knowledge, making it easier to share with others while maintaining control over the
content.

### 📬 Social & Contact

* **Blog:** [blog.douglasmedeiros.dev](https://blog.douglasmedeiros.dev)
* **GitHub:** [@medeirosinacio](https://github.com/medeirosinacio)
* **LinkedIn:** [Douglas Medeiros](https://www.linkedin.com/in/medeirosinacio/)
* **Twitter:** [@aqueleMetal](https://x.com/aqueleMetal)

### 🏗️ Project Architecture

#### Technologies Used

* **Jekyll:** Static site generator for easy content management and GitHub Pages compatibility.
* **GitHub Pages:** Free, fast, and reliable static hosting.
* **Bootstrap:** Responsive and modern UI framework.
* **Vanilla JavaScript:** For interactive features (image zoom, code copy, etc.).
* **Utterances:** GitHub-based comments integration.

> [!IMPORTANT]
> 💡 The entire architecture runs at zero cost, using open-source tools and GitHub’s native support for static content
> hosting.

#### Project Structure

```
.
├── _posts/           # Markdown articles (blog posts)
├── _layouts/         # Custom Jekyll layouts and templates
├── assets/           # Images, CSS, JS, and other static assets
├── _includes/        # Reusable HTML snippets (e.g., share buttons)
├── _config.yml       # Jekyll configuration
├── Gemfile           # Ruby dependencies
└── README.md         # Project documentation
```

### ✍️ Writing Articles

This blog uses Copilot Instructions to maintain consistent writing style when creating articles from transcriptions or notes.

#### Creating Articles with AI Assistance

The `.github/copilot-instructions.md` file contains detailed guidelines for:
- Writing tone and style
- Article structure and formatting
- Using blockquotes and special alerts
- Converting speech transcriptions into articles

📖 **For detailed instructions on how to use this feature, see [.github/README-COPILOT.md](.github/README-COPILOT.md)**

#### Manual Article Creation

Articles are written in Markdown and stored in the `_posts/` directory with the naming convention:

```
YYYY-MM-DD-title-of-article.md
```

Each article must include YAML front matter with metadata (title, date, categories, tags, image, description).

### 🚀 Running Locally

#### Prerequisites

- Git
- Docker

#### Setup

Clone the repository:

```shell
  git clone https://github.com/medeirosinacio/blog.douglasmedeiros.dev.git
  cd blog.douglasmedeiros.dev
```

Run the project:

```shell
  make setup
```

This will start a Docker container with Jekyll, allowing you to preview the site locally at `http://localhost:4000`.

### ⚖️ License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
