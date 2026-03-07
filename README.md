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

1. Click the green **Code** button at the top of this repository page and
   select **Open with Codespaces → New codespace**
2. A **VS Code window** opens in your browser — this is normal. Do not close
   it. RStudio runs inside the same environment, on a separate port.
3. **The first time you create a Codespace, setup takes up to 5 minutes.**
   R and all required packages are downloaded and installed automatically.
   You can watch progress in the terminal at the bottom of the VS Code window.
4. Once the environment is ready, a second browser tab with **RStudio Server**
   should open automatically. If it does not, click the **Ports** tab at the
   bottom of the VS Code window, find port **8787**, and click the globe icon
   next to it. No login is required — RStudio opens directly.
5. **Important:** even after RStudio opens, package installation may still be
   running in the background. Wait until the terminal in VS Code shows a plain
   command prompt (no spinner, no scrolling output) before loading packages in
   R — otherwise some may not yet be available.

> Subsequent starts of the same Codespace are fast — the image is cached and
> packages are already installed. Only the very first creation takes long.
>
> Codespace hours are free for students via the GitHub Student Developer Pack.
> Close your Codespace when you are not using it to avoid consuming your free
> allowance.

### A note on saving your work

The Material repo Codespace is for **running in-class exercises**. Because this
is a shared course repository, you do not have permission to push changes back
to it — and you should not need to.

Your work is preserved in the Codespace between sessions as long as the
Codespace exists. If you delete the Codespace, any local changes are lost.

### Getting your own copy for home use

If you want a personal copy of the course materials that you can edit, save,
and use freely — **fork this repository**.

1. Click **Fork** in the top-right corner of this page on GitHub
2. GitHub creates a copy of this repo under your own account
3. Open a Codespace from your fork — the environment is identical, and you can
   commit and push your own changes freely
4. When new session materials are added to this repo, click **Sync fork** on
   your fork's GitHub page, then **Pull** in the RStudio Git pane to receive
   the updates

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
