# =============================================================================
# Session 5 — DAG figures (ggdag version)
# Generates four PNG files into figures/ relative to this script
# Run once before rendering session05-slides.qmd
#
# Packages: ggdag, dagitty, tidyverse, patchwork
# Add ggdag and dagitty to your devcontainer.json package list if not present
# =============================================================================
here::i_am("sessions/session_05/session05-generate-dags.R")
library(here)
library(tidyverse)
library(ggdag)      # builds on dagitty + ggplot2
library(dagitty)    # underlying DAG logic (loaded automatically with ggdag)
library(patchwork)

dir.create(here("sessions/session_05/figures"), showWarnings = FALSE)

# -----------------------------------------------------------------------------
# Shared theme
# -----------------------------------------------------------------------------

theme_dag_clean <- function() {
  theme_dag() +
    theme(
      plot.background  = element_rect(fill = "white", colour = NA),
      panel.background = element_rect(fill = "white", colour = NA),
      plot.margin      = margin(16, 16, 16, 16),
      legend.position  = "none"
    )
}

# Colour palette (consistent with course brand)
col_default    <- "#d6e4f0"   # standard node
col_confounder <- "#fde8d8"   # warm orange
col_mediator   <- "#d5f5e3"   # green
col_collider   <- "#e8daef"   # purple
col_unobserved <- "#fef9e7"   # yellow — unobserved variable
col_blocked    <- "#ecf0f1"   # grey   — controlled-for node
col_text       <- "#2c3e50"
col_grey_text  <- "#7f8c8d"
col_blocked_edge <- "#bdc3c7"

# =============================================================================
# DAG 1 — Hiring provocation
# Product Quality confounds Sales Staff -> Revenue
# =============================================================================

coords_hiring <- list(
  x = c(SalesStaff = 0, Revenue = 2, ProductQuality = 1),
  y = c(SalesStaff = 0, Revenue = 0, ProductQuality = 1.6)
)

dag_hiring <- dagify(
  Revenue     ~ SalesStaff + ProductQuality,
  SalesStaff  ~ ProductQuality,
  exposure = "SalesStaff",
  outcome  = "Revenue",
  labels = c(
    SalesStaff     = "Sales\nStaff",
    Revenue        = "Revenue",
    ProductQuality = "Product\nQuality"
  ),
  coords = coords_hiring
)

p_hiring <- dag_hiring |>
  tidy_dagitty() |>
  mutate(
    node_fill = case_when(
      name == "ProductQuality" ~ col_confounder,
      TRUE                     ~ col_default
    )
  ) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text,
    edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill),
    shape = 21, size = 16,
    colour = col_text, stroke = 1.2,
    show.legend = FALSE
  ) +
  scale_fill_identity() +
  annotate("text", x = -0.22, y = 0,
           label = "Sales\nStaff", hjust = 1, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text, lineheight = 0.9) +
  annotate("text", x = 2.22, y = 0,
           label = "Revenue", hjust = 0, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 1, y = 1.88,
           label = "Product\nQuality", hjust = 0.5, vjust = 0,
           size = 3.8, fontface = "bold", colour = col_text, lineheight = 0.9) +
  annotate("text", x = 1, y = 2.22,
           label = "confounder", size = 3.5,
           colour = "#e67e22", fontface = "italic") +
  coord_cartesian(xlim = c(-0.7, 2.8), ylim = c(-0.4, 2.5)) +
  theme_dag_clean()

ggsave(here("sessions/session_05/figures/dag_hiring.png"), p_hiring,
       width = 6, height = 4.2, dpi = 180, bg = "white")
message("Saved: figures/dag_hiring.png")

# =============================================================================
# DAG 2 — Three structural roles (3-panel)
# Panel A: Confounder   C -> X, C -> Y, X -> Y
# Panel B: Mediator     X -> M -> Y, X -> Y (direct)
# Panel C: Collider     X -> Co <- Y
# =============================================================================

# --- Panel A: Confounder ---
dag_conf <- dagify(
  Y ~ X + C,
  X ~ C,
  labels = c(X = "X", Y = "Y", C = "C"),
  coords = list(
    x = c(X = 0, Y = 2, C = 1),
    y = c(X = 0, Y = 0, C = 1.6)
  )
)

p_conf <- dag_conf |>
  tidy_dagitty() |>
  mutate(node_fill = if_else(name == "C", col_confounder, col_default)) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill), shape = 21, size = 14,
    colour = col_text, stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  geom_dag_text(colour = col_text, size = 4.5, fontface = "bold") +
  annotate("text", x = 1, y = 2.1,
           label = "confounder", size = 3.5,
           colour = "#e67e22", fontface = "italic") +
  annotate("text", x = 1, y = -0.5,
           label = "Must control for C",
           size = 3, colour = col_grey_text) +
  ylim(-0.8, 2.5) +
  theme_dag_clean()

# --- Panel B: Mediator ---
dag_med <- dagify(
  Y ~ M + X,
  M ~ X,
  labels = c(X = "X", Y = "Y", M = "M"),
  coords = list(
    x = c(X = 0, Y = 2, M = 1),
    y = c(X = 0, Y = 0, M = 1.6)
  )
)

p_med <- dag_med |>
  tidy_dagitty() |>
  mutate(node_fill = if_else(name == "M", col_mediator, col_default)) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill), shape = 21, size = 14,
    colour = col_text, stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  geom_dag_text(colour = col_text, size = 4.5, fontface = "bold") +
  annotate("text", x = 1, y = 2.1,
           label = "mediator", size = 3.5,
           colour = "#27ae60", fontface = "italic") +
  annotate("text", x = 1, y = -0.5,
           label = "Do NOT control for M",
           size = 3, colour = col_grey_text) +
  ylim(-0.8, 2.5) +
  theme_dag_clean()

# --- Panel C: Collider ---
dag_col <- dagify(
  Co ~ X + Y,
  labels = c(X = "X", Y = "Y", Co = "Co"),
  coords = list(
    x = c(X = 0, Y = 2, Co = 1),
    y = c(X = 0, Y = 0, Co = 1.6)
  )
)

p_col <- dag_col |>
  tidy_dagitty() |>
  mutate(node_fill = if_else(name == "Co", col_collider, col_default)) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill), shape = 21, size = 14,
    colour = col_text, stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  geom_dag_text(colour = col_text, size = 4.5, fontface = "bold") +
  annotate("text", x = 1, y = 2.1,
           label = "collider", size = 3.5,
           colour = "#8e44ad", fontface = "italic") +
  annotate("text", x = 1, y = -0.5,
           label = "Do NOT control for Co",
           size = 3, colour = col_grey_text) +
  ylim(-0.8, 2.5) +
  theme_dag_clean()

p_three_roles <- (p_conf + p_med + p_col) +
  plot_layout(ncol = 3) &
  theme(plot.background = element_rect(fill = "white", colour = NA))

ggsave(here("sessions/session_05/figures/dag_three_roles.png"), p_three_roles,
       width = 10, height = 4.2, dpi = 180, bg = "white")
message("Saved: figures/dag_three_roles.png")

# =============================================================================
# DAG 3 — Gender wage gap
# Gender -> Wage (direct)
# Gender -> Occupation -> Wage (mediator: occupational sorting)
# Background -> Occupation + Wage (unobserved confounder)
# =============================================================================

coords_gender <- list(
  x = c(Gender = 0, Wage = 3, Occupation = 1.5, Background = 1.5),
  y = c(Gender = 1.5, Wage = 1.5, Occupation = 0, Background = 3)
)

dag_gender <- dagify(
  Wage       ~ Gender + Occupation + Background,
  Occupation ~ Gender + Background,
  exposure = "Gender",
  outcome  = "Wage",
  labels = c(
    Gender     = "Gender",
    Wage       = "Wage",
    Occupation = "Occupation",
    Background = "Background\n(unobserved)"
  ),
  coords = coords_gender
)

p_gender_wage <- dag_gender |>
  tidy_dagitty() |>
  mutate(
    node_fill = case_when(
      name == "Background" ~ col_unobserved,
      name == "Occupation" ~ col_mediator,
      TRUE                 ~ col_default
    ),
    node_colour = case_when(
      name == "Background" ~ "#f39c12",
      TRUE                 ~ col_text
    )
  ) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill, colour = node_colour),
    shape = 21, size = 17, stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  scale_colour_identity() +
  annotate("text", x = -0.3, y = 1.5,
           label = "Gender", hjust = 1, vjust = 0.5,
           size = 3.5, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.25, y = 1.5,
           label = "Wage", hjust = 0, vjust = 0.5,
           size = 3.5, fontface = "bold", colour = col_text) +
  annotate("text", x = 0.8, y = 3.0,
           label = "Background\n(unobserved)", hjust = 0.5, vjust = 0,
           size = 3.5, fontface = "bold", colour = col_text, lineheight = 0.9) +
  annotate("text", x = 0.8, y = 0.05,
           label = "Occupation", hjust = 0.5, vjust = 1,
           size = 3.5, fontface = "bold", colour = col_text) +
  annotate("text", x = 1.5, y = -0.65,
           label = "mediator (occupational sorting)",
           size = 3.2, colour = "#27ae60", fontface = "italic") +
  annotate("text", x = 1.5, y = 3.68,
           label = "confounder (unobserved)",
           size = 3.2, colour = "#e67e22", fontface = "italic") +
  coord_cartesian(xlim = c(-0.9, 4.2), ylim = c(-1.1, 4.2)) +
  theme_dag_clean()

ggsave(here("sessions/session_05/figures/dag_gender_wage.png"), p_gender_wage,
       width = 7, height = 5.5, dpi = 180, bg = "white")
message("Saved: figures/dag_gender_wage.png")

# =============================================================================
# DAG 4 — Bad control
# Same structure as DAG 3, but Occupation is controlled for:
#   - Occupation node greyed out
#   - All edges touching Occupation greyed and dashed
#   - Explanatory annotation added
#
# Strategy: split tidy data frame into blocked/active subsets,
# draw edges in two separate geom_dag_edges_link() calls
# =============================================================================

tidy_bad <- dag_gender |>
  tidy_dagitty() |>
  mutate(
    # An edge is "blocked" if it originates from or points to Occupation
    blocked = (name == "Occupation" | to == "Occupation"),
    node_fill = case_when(
      name == "Occupation" ~ col_blocked,
      name == "Background" ~ col_unobserved,
      TRUE                 ~ col_default
    ),
    node_colour = case_when(
      name == "Occupation" ~ col_blocked_edge,
      name == "Background" ~ "#f39c12",
      TRUE                 ~ col_text
    )
  )

p_bad_control <- ggplot(tidy_bad,
                        aes(x = x, y = y, xend = xend, yend = yend)) +
  # Active edges
  geom_dag_edges_link(
    data = ~ filter(.x, !blocked),
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  # Blocked edges — greyed, dashed
  geom_dag_edges_link(
    data = ~ filter(.x, blocked),
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_blocked_edge,
    edge_linewidth = 0.6,
    edge_linetype = "dashed"
  ) +
  # Nodes
  geom_dag_point(
    aes(fill = node_fill, colour = node_colour),
    shape = 21, size = 17, stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  scale_colour_identity() +
  # Node labels \u2014 fixed positions outside circles
  annotate("text", x = -0.3, y = 1.5,
           label = "Gender", hjust = 1, vjust = 0.5,
           size = 3.5, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.3, y = 1.5,
           label = "Wage", hjust = 0, vjust = 0.5,
           size = 3.5, fontface = "bold", colour = col_text) +
  annotate("text", x = 0.8, y = 3,
           label = "Background\n(unobserved)", hjust = 0.5, vjust = 0,
           size = 3.5, fontface = "bold", colour = col_text, lineheight = 0.9) +
  annotate("text", x = 1.5, y = -0.14,
           label = "Occupation", hjust = 0.5, vjust = 1,
           size = 3.2, fontface = "bold", colour = col_blocked_edge) +
  # Cross mark on Occupation node
  annotate("text", x = 1.5, y = 0,
           label = "\u2717", size = 8, colour = "#e74c3c") +
  # Bottom annotation
  annotate("text", x = 1.5, y = -0.75,
           label = "Controlled for \u2192 indirect path blocked\nCoefficient on Gender = within-occupation gap only",
           size = 3, colour = "#c0392b",
           fontface = "italic", lineheight = 0.9, hjust = 0.5) +
  annotate("text", x = 1.5, y = 3.68,
           label = "confounder (unobserved)",
           size = 3.2, colour = "#e67e22", fontface = "italic") +
  coord_cartesian(xlim = c(-0.9, 4.2), ylim = c(-1.2, 4.2)) +
  theme_dag_clean()

ggsave(here("sessions/session_05/figures/dag_bad_control.png"), p_bad_control,
       width = 7, height = 5.5, dpi = 180, bg = "white")
message("Saved: figures/dag_bad_control.png")

# =============================================================================
# Done
# =============================================================================

message("\nAll four DAG figures saved to figures/")
message("Remember to add to devcontainer.json: \"ggdag\", \"dagitty\"")
