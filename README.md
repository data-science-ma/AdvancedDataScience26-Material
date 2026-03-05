# Data Science and Econometrics for International Business

**M.A. International Business Studies — Spring 2026**
**Europa-Universität Flensburg**
**Instructor:** Prof. Dr. Claudius Gräbner-Radkowitsch

This repository contains all course materials: slides, exercises, solutions,
take-home task sheets, and datasets.

The public course website (syllabus, schedule, session overviews) is at:
[quantitative-data-analysis-spring26.netlify.app](https://quantitative-data-analysis-spring26.netlify.app)

---

## Accessing the materials

### Just reading or downloading files

No setup needed. Browse the session folders directly here on GitHub and open
any file to read it. To download a file, open it and click the download icon
(top right). To download everything at once, click the green **Code** button →
**Download ZIP**.

Rendered slides are provided as self-contained `.html` files in each session
folder — open them in any browser.

**To save slides as PDF:** open the `.html` file in Chrome or Edge, add
`?print-pdf` to the end of the URL, then use **File → Print → Save as PDF**
(enable "Background graphics" in print options for correct styling).

### Coding along / doing exercises

**Option A — GitHub Codespaces (recommended):** No installation needed.
All R packages are pre-installed.

1. Click the green **Code** button at the top of this page
2. Select **Codespaces → Create codespace on main**
3. RStudio opens in your browser — you are ready to work

**Option B — Local RStudio:** Download or clone the repository and open
`AdvancedDataScience26.Rproj` in RStudio. Install packages if prompted:

```r
install.packages(c("tidyverse", "plm", "modelsummary", "fixest",
                   "lmtest", "sandwich", "patchwork"))
```

---

## Session materials

| # | Date | Topic | Folder |
|:---:|---|---|---|
| 1 | Thu, 12 Mar | Welcome, recap & tooling upgrade | [sessions/session_01](sessions/session_01/) |
| 2 | Thu, 09 Apr | Multiple regression: going beyond the basics | *coming soon* |
| 3 | Thu, 30 Apr | Modelling binary and categorical outcomes | *coming soon* |
| 4 | Thu, 07 May | What can go wrong: biases and diagnostics | *coming soon* |
| 5 | Thu, 21 May | Causation vs. correlation: thinking like an economist | *coming soon* |
| 6 | Thu, 28 May | Panel data and fixed effects | *coming soon* |
| 7 | Thu, 04 Jun | Coding smarter: R and AI tools | *coming soon* |
| 8 | Thu, 11 Jun | Communicating data: advanced visualization | *coming soon* |
| 9 | Thu, 18 Jun | Recap and looking ahead | *coming soon* |

Each session folder contains:

```
session_XX/
├── slides.qmd       — lecture slides
├── demo.qmd         — live coding document 
├── exercise.qmd     — in-session exercise sheet
├── references.bib   — bibliography for the session
└── data/            — session datasets
```

---

## Take-home tasks

| Task | Assigned | Due | Folder |
|---|---|---|---|
| Task 1 — Regression basics | End of Session 1 (12 Mar) | 02 Apr, 08:00 | [take-home/task_01](take-home/task_01/) |
| Task 2 — Extending a regression | End of Session 2 (09 Apr) | 30 Apr, 08:00 | [take-home/task_02](take-home/task_02/) |

Tasks are distributed via **GitHub Classroom**. The link for each task is
shared at the end of the session in which it is assigned.

---

## Shared resources

| File | Purpose |
|---|---|
| [`templates/quarto_report_template.qmd`](templates/quarto_report_template.qmd) | Starter template for your own reports |
| [`templates/references.bib`](templates/references.bib) | Shared bibliography (add entries as needed) |
| [`assets/custom.scss`](assets/custom.scss) | Slide and report styling |

---

## Questions and discussions

**All course questions go through [GitHub Discussions](../../discussions)** —
not email. This keeps answers visible to everyone and builds a searchable
knowledge base for the whole class.

### How to use Discussions

**Finding it:** Click the **Discussions** tab at the top of this repository
(next to Code, Issues, Pull requests).

**Before posting:** Use the search bar to check whether your question has
already been answered.

**How to post a good question:**

1. Choose the right category (see below)
2. Write a clear, specific title — *"Error in Task 1 Task 3"* is less
   useful than *"modelsummary table not showing in rendered HTML"*
3. Include a **minimal reproducible example**: the smallest piece of code
   that shows the problem, plus the error message
4. Mention what you already tried

**Markdown works in Discussions** — format code with triple backticks:

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
| **Sessions** | Questions about specific session content or exercise tasks |
| **Tasks** | Questions about take-home tasks (Task 1, Task 2) |
| **General** | Everything else — study groups, resources, feedback |

### Marking answers as helpful

If a reply solves your problem, click **Mark as answer** — this helps
classmates find solutions quickly when they have the same issue.

### Response times

The instructor monitors Discussions regularly during the semester, including
during the two take-home task periods (19 March–26 March and 16 April–23 April).
Expect a response within 48 hours on weekdays.

---

*Course website: [quantitative-data-analysis-spring26.netlify.app](https://quantitative-data-analysis-spring26.netlify.app)*
