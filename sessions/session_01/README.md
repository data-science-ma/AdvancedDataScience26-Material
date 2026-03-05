# Session 1 — Welcome, Recap & Tooling Upgrade

**Date:** Thursday, 12 March 2026, 16:00–19:00
**Course:** Data Science and Econometrics for International Business (Spring 2026)
**Instructor:** Prof. Dr. Claudius Gräbner-Radkowitsch

---

This session sets up the foundations for the whole course. You will refresh your
R and Quarto skills, establish a clean reproducible project workflow, and get
oriented with Git and GitHub — the tools you will use for every submission.
By the end, you will have a working Quarto document that renders to both HTML
and Word, with numbered sections, a table of contents, and a bibliography.

---

## Files in this folder

| File | Purpose |
|---|---|
| `slides.qmd` | Instructor slides (revealjs) — admin, Git orientation, Task 1 intro |
| `demo.qmd` | Live demo document built during the session; also serves as a model for your own reports |
| `exercise.qmd` | In-session exercise sheet — 60 min, done individually or in pairs |
| `solution.qmd` | Instructor solution for the exercise — not distributed to students |
| `task01.qmd` | Take-home Task 1 handout — distributed at the end of the session |
| `references.bib` | Pre-made bibliography file — copy into your own project folder |
| `data/` | Empty for this session — no dataset needed |

---

## Before the session

Nothing is required. If you want a head start, skim the Quarto documentation on
[HTML document basics](https://quarto.org/docs/output-formats/html-basics.html).

Make sure you have a **GitHub account** before arriving. If you have not yet
registered for the **GitHub Student Developer Pack**, do so at
[education.github.com/pack](https://education.github.com/pack).

---

## Session flow

| Time | Block |
|---|---|
| 16:00–16:20 | Welcome, course overview, assessment |
| 16:20–17:00 | Quarto upgrade: live demo document (`demo.qmd`) |
| 17:00–17:15 | Git orientation |
| 17:15–18:15 | Student exercise (`exercise.qmd`) |
| 18:15–19:00 | Introduce Task 1, Q&A |

---

## Git: the four things you need

All Git interaction in this course happens via the **RStudio Git pane** —
no command line required.

| Action | What it does |
|---|---|
| **Pull** | Download the latest version of the repository from GitHub |
| **Stage** | Select which changed files to include in your next snapshot |
| **Commit** | Save a snapshot of the staged files with a short description |
| **Push** | Upload your snapshot to GitHub |

That is all. No branching, no merging.

For a full self-contained introduction, work through the free
[GitHub Skills: Introduction to GitHub](https://github.com/skills/introduction-to-github) tutorial.

---

## Take-home Task 1

**Assigned:** end of this session (12 March)
**Due:** Thursday, 02 April 2026, 08:00

You are an analyst producing a briefing document on global development patterns.
Using the World Bank life expectancy dataset (182 countries, 2017), you will:

1. Explore the data with summary statistics and plots
2. Estimate a simple regression of life expectancy on GDP per capita
3. Try a log transformation and explain whether it improves the fit
4. Add one additional variable and compare models in a `modelsummary` table
5. Write a 150-word plain-language summary for a non-technical reader

**Submission:** Render to HTML and push both the `.qmd` and `.html` files to
your GitHub Classroom repository.
Fallback: upload the `.html` file to Moodle if the GitHub push fails.

The task sheet is in `task01.qmd` in this folder.

---

## Questions?

Post in **GitHub Discussions** on this repository.
Questions asked there benefit everyone — please do not email directly.
