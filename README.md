# Data Science and Econometrics for International Business

**M.A. International Business Studies — Spring 2026**
**Europa-Universität Flensburg**
**Instructor:** Prof. Dr. Claudius Gräbner-Radkowitsch

---

**All course materials** (slides, exercises, demo documents, datasets) are distributed via the course website.

To save slides as PDF: open the slide HTML in Chrome or Edge, click ☰ (bottom-left) → Tools → PDF Export Mode, then **File → Print → Save as PDF**. Alternatively, add `?print-pdf` to the end of the URL and print from there.



[quantitative-data-analysis-spring26.netlify.app](https://quantitative-data-analysis-spring26.netlify.app)

---

## What this repository is for

This repository serves two purposes:

1. **GitHub Discussions** — the place to ask questions, get help, and discuss course content (see below)
2. **Take-home task templates** — the starting files for GitHub Classroom assignments

It is not the primary source of course materials. Go to the website for slides, exercises, and session content.

---

## Take-home tasks

Take-home tasks are distributed via **GitHub Classroom**. The link for each task is shared at the end of the session in which it is assigned, and posted on the course website.

| Task | Assigned | Due |
|---|---|---|
| Task 1 — Earnings, age, and hours worked | End of Session 1 (12 Mar) | 02 Apr, 23:59 |
| Task 2 — Hotel prices across European cities | End of Session 2 (09 Apr) | 29 Apr, 23:59 |

---

## Working in a Codespace

This repository includes a pre-configured development environment. If you
prefer not to install R locally, you can run everything in a **GitHub
Codespace** — a cloud-based RStudio session that runs entirely in your browser.

### How to start a Codespace

**Fork this repository first** — click **Fork** in the top-right corner of this page to create your own personal copy. All steps below apply to your fork, not the shared course repository.

1. On your fork's page, click the green **Code** button and
   select **Open with Codespaces → New codespace**
2. A **VS Code window** opens in your browser — this is normal. Do not close
   it.
3. **The first time you create a Codespace, setup takes up to 5 minutes.**
   R and all required packages are downloaded and installed automatically.
   You can watch progress in the terminal at the bottom of the VS Code window.
4. Once setup is complete, type **`rserver`** in the VS Code terminal and press
   **Enter**. When the login prompt appears, enter **`rstudio`** as both the
   username and the password.
5. **Important:** even after RStudio opens, package installation may still be
   running in the background. Wait until the terminal shows a plain command
   prompt (no spinner, no scrolling output) before loading packages in R.

> **Next time:** do not create a new Codespace — go to
> [github.com/codespaces](https://github.com/codespaces), find your existing
> Codespace, and click **Open**. Creating a new Codespace means any uncommitted
> work is lost.
>
> Codespace hours are free for students via the GitHub Student Developer Pack.
> Close your Codespace when you are not using it to avoid consuming your free
> allowance.

### A note on saving your work

Because you work in your own fork, you have full permission to commit and push
your changes. Your work is also preserved in the Codespace between sessions as
long as the Codespace exists — which is why you should always **open the
existing Codespace** rather than creating a new one.

If you accidentally delete your Codespace, any committed and pushed work is
still safe on GitHub. Uncommitted changes, however, are lost.

### Syncing new session materials

When new materials are added to the course repository, click **Sync fork** on
your fork's GitHub page, then **Pull** in the RStudio Git pane to receive the
updates.

Take-home tasks work differently: when you accept a task via GitHub Classroom,
you get your **own personal copy** of the assignment repository. Commits from
within that task's Codespace go directly to your personal repo — that is how
you submit.

---

## Questions and discussions

**All course questions go through [GitHub Discussions](../../discussions)** — not email. This keeps answers visible to everyone and builds a searchable knowledge base for the whole class.

### How to post a good question

1. **Search first** — use the search bar to check whether your question has already been answered
2. **Choose the right category** (see below)
3. **Write a specific title** — *"modelsummary table not rendering in HTML"* is more useful than *"help with Task 1"*
4. **Include a minimal example** — the smallest piece of code that shows the problem, plus the full error message
5. **Say what you already tried**

Format code with triple backticks:

````
```r
library(tidyverse)
# your code here
```
````

### Discussion categories

| Category | Use it for |
|---|---|
| **Announcements** | Official announcements from the instructor (read-only for students) |
| **Q&A** | Technical questions about R, Quarto, Git, or course tools |
| **Sessions** | Questions about specific session content or exercises |
| **Tasks** | Questions about take-home tasks |
| **General** | Everything else — study groups, resources, feedback |

### Marking answers

If a reply solves your problem, click **Mark as answer** — this helps classmates find solutions quickly.

### Response times

The instructor monitors Discussions regularly, including during the take-home task periods. Expect a reply within 48 hours on weekdays.

---

*Course website: [quantitative-data-analysis-spring26.netlify.app](https://quantitative-data-analysis-spring26.netlify.app)*
