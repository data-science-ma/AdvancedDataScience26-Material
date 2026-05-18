# =============================================================================
# Session 6 — Healthcare DAG: confounder vs. mediator
# Generates: figures/dag-healthcare.png
# Run before rendering slides.qmd
#
# Panel A: Healthcare as Mediator  — Income -> Healthcare -> Happiness
# Panel B: Healthcare as Confounder — Institutions drives both Income and
#           Healthcare independently; Healthcare -> Happiness
# =============================================================================
here::i_am("sessions/session_06/session06-generate-healthcare-dag.R")
library(here)
library(tidyverse)
library(ggdag)
library(dagitty)
library(patchwork)

dir.create(here("sessions/session_06/figures"), showWarnings = FALSE)

# --- Shared style (consistent with session 5 DAGs) ---
col_default    <- "#d6e4f0"   # standard node (income, happiness)
col_mediator   <- "#d5f5e3"   # green  — mediator
col_confounder <- "#fde8d8"   # orange — confounder
col_unobserved <- "#fef9e7"   # yellow — unobserved variable
col_text       <- "#2c3e50"
col_grey_text  <- "#7f8c8d"
node_size      <- 15

theme_dag_clean <- function() {
  theme_dag() +
    theme(
      plot.background  = element_rect(fill = "white", colour = NA),
      panel.background = element_rect(fill = "white", colour = NA),
      plot.margin      = margin(12, 20, 12, 20),
      legend.position  = "none"
    )
}

# =============================================================================
# Panel A — Healthcare as Mediator
# Triangle layout: Income (bottom-left), Happiness (bottom-right), Healthcare (top)
# Income -> Healthcare, Healthcare -> Happiness, Income -> Happiness (direct)
# =============================================================================

dag_med <- dagify(
  Happiness  ~ Income + Healthcare,
  Healthcare ~ Income,
  coords = list(
    x = c(Income = 0, Happiness = 3, Healthcare = 1.5),
    y = c(Income = 0, Happiness = 0, Healthcare = 1.8)
  )
)

p_med <- dag_med |>
  tidy_dagitty() |>
  mutate(
    node_fill = if_else(name == "Healthcare", col_mediator, col_default)
  ) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill),
    shape = 21, size = node_size,
    colour = col_text, stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  # Node labels
  annotate("text", x = -0.5, y = 0,
           label = "Income", hjust = 1, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.5, y = 0,
           label = "Happiness", hjust = 0, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 1.5, y = 2.2,
           label = "Healthcare", hjust = 0.5, vjust = 0,
           size = 3.8, fontface = "bold", colour = col_text) +
  # Role label
  annotate("text", x = 1.5, y = 2.55,
           label = "mediator", hjust = 0.5,
           size = 3.3, colour = "#27ae60", fontface = "italic") +
  # Implication
  annotate("text", x = 1.5, y = -0.55,
           label = "Controlling for healthcare\nremoves the mediated path → direct effect only",
           hjust = 0.5, vjust = 1,
           size = 2.9, colour = col_grey_text, lineheight = 0.9) +
  coord_cartesian(xlim = c(-1.3, 4.5), ylim = c(-1.2, 3.1)) +
  labs(title = "A — Healthcare as Mediator") +
  theme_dag_clean() +
  theme(plot.title = element_text(size = 11, face = "bold", colour = col_text,
                                  margin = margin(b = 4)))

# =============================================================================
# Panel B — Healthcare as Confounder
# Rectangle layout:
#   Institutions (top-left) -> Income (bottom-left)
#   Institutions (top-left) -> Healthcare (top-right)
#   Healthcare (top-right)  -> Happiness (bottom-right)
#   Income (bottom-left)    -> Happiness (bottom-right)
#
# Key: NO Income -> Healthcare arrow — that's what makes Healthcare a confounder
# =============================================================================

dag_conf <- dagify(
  Happiness  ~ Income + Healthcare,
  Income     ~ Institutions,
  Healthcare ~ Institutions,
  coords = list(
    x = c(Income = 0, Happiness = 3, Healthcare = 3, Institutions = 0),
    y = c(Income = 0, Happiness = 0, Healthcare = 1.8, Institutions = 1.8)
  )
)

p_conf <- dag_conf |>
  tidy_dagitty() |>
  mutate(
    node_fill = case_when(
      name == "Healthcare"   ~ col_confounder,
      name == "Institutions" ~ col_unobserved,
      TRUE                   ~ col_default
    ),
    node_colour = case_when(
      name == "Institutions" ~ "#f39c12",
      TRUE                   ~ col_text
    )
  ) |>
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_edges(
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  geom_dag_point(
    aes(fill = node_fill, colour = node_colour),
    shape = 21, size = node_size,
    stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  scale_colour_identity() +
  # Node labels
  annotate("text", x = -0.5, y = 0,
           label = "Income", hjust = 1, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.5, y = 0,
           label = "Happiness", hjust = 0, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.5, y = 2.3,
           label = "Healthcare", hjust = 0, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = -0.22, y = 2.3,
           label = "Institutions\n(unobserved)", hjust = 1, vjust = 0.5,
           size = 3.5, fontface = "bold", colour = col_text, lineheight = 0.9) +
  # Role labels
  annotate("text", x = 3.22, y = 2.12,
           label = "confounder", hjust = 0,
           size = 3.3, colour = "#e67e22", fontface = "italic") +
  annotate("text", x = -0.5, y = 2.0,
           label = "unobserved", hjust = 1,
           size = 3.3, colour = "#e67e22", fontface = "italic") +
  # Implication
  annotate("text", x = 1.5, y = -0.55,
           label = "Controlling for healthcare removes\nthe spurious correlation → cleaner income effect",
           hjust = 0.5, vjust = 1,
           size = 2.9, colour = col_grey_text, lineheight = 0.9) +
  coord_cartesian(xlim = c(-1.8, 4.8), ylim = c(-1.2, 2.7)) +
  labs(title = "B — Healthcare as Confounder") +
  theme_dag_clean() +
  theme(plot.title = element_text(size = 11, face = "bold", colour = col_text,
                                  margin = margin(b = 4)))

# =============================================================================
# Panel C — Healthcare as Both (the realistic case)
# Same rectangle as Panel B, but with an added Income -> Healthcare arrow.
# Healthcare is now a partial mediator AND a partial confounder.
# =============================================================================

dag_both <- dagify(
  Happiness  ~ Income + Healthcare,
  Healthcare ~ Income + Institutions,
  Income     ~ Institutions,
  coords = list(
    x = c(Income = 0, Happiness = 3, Healthcare = 3, Institutions = 0),
    y = c(Income = 0, Happiness = 0, Healthcare = 1.8, Institutions = 1.8)
  )
)

# Split edges: the Income->Healthcare arrow is the new one — draw it differently
# to make the two mechanisms visually distinguishable
tidy_both <- dag_both |>
  tidy_dagitty() |>
  mutate(
    node_fill = case_when(
      name == "Healthcare"   ~ "#e8daef",   # purple-ish: mixed role
      name == "Institutions" ~ col_unobserved,
      TRUE                   ~ col_default
    ),
    node_colour = case_when(
      name == "Institutions" ~ "#f39c12",
      TRUE                   ~ col_text
    ),
    # Flag the Income->Healthcare edge as the mediation channel
    mediation_edge = (name == "Income" & to == "Healthcare")
  )

p_both <- ggplot(tidy_both, aes(x = x, y = y, xend = xend, yend = yend)) +
  # Confounding / direct edges
  geom_dag_edges_link(
    data = ~ filter(.x, !mediation_edge),
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = col_text, edge_linewidth = 0.7
  ) +
  # Income -> Healthcare (mediation channel) — dashed to distinguish
  geom_dag_edges_link(
    data = ~ filter(.x, mediation_edge),
    arrow_directed = grid::arrow(length = unit(8, "pt"), type = "closed"),
    edge_colour = "#27ae60", edge_linewidth = 0.7, edge_linetype = "dashed"
  ) +
  geom_dag_point(
    aes(fill = node_fill, colour = node_colour),
    shape = 21, size = node_size,
    stroke = 1.2, show.legend = FALSE
  ) +
  scale_fill_identity() +
  scale_colour_identity() +
  # Node labels
  annotate("text", x = -0.5, y = 0,
           label = "Income", hjust = 1, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.5, y = 0,
           label = "Happiness", hjust = 0, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = 3.5, y = 2.3,
           label = "Healthcare", hjust = 0, vjust = 0.5,
           size = 3.8, fontface = "bold", colour = col_text) +
  annotate("text", x = -0.22, y = 2.3,
           label = "Institutions\n(unobserved)", hjust = 1, vjust = 0.5,
           size = 3.5, fontface = "bold", colour = col_text, lineheight = 0.9) +
  # Role label
  annotate("text", x = 3.22, y = 2.12,
           label = "confounder + mediator", hjust = 0,
           size = 3.0, colour = "#8e44ad", fontface = "italic") +
  annotate("text", x = -0.5, y = 2.0,
           label = "unobserved", hjust = 1,
           size = 3.3, colour = "#e67e22", fontface = "italic") +
  # Legend for dashed arrow
  annotate("text", x = 1.5, y = 2.12,
           label = "-- mediation channel",
           hjust = 0.5, size = 2.8, colour = "#27ae60", fontface = "italic") +
  # Implication
  annotate("text", x = 1.5, y = -0.55,
           label = "Controlling removes some confounding\nAND some mediation — effect ambiguous",
           hjust = 0.5, vjust = 1,
           size = 2.9, colour = col_grey_text, lineheight = 0.9) +
  coord_cartesian(xlim = c(-1.8, 4.8), ylim = c(-1.2, 2.7)) +
  labs(title = "C — Healthcare as Both") +
  theme_dag_clean() +
  theme(plot.title = element_text(size = 11, face = "bold", colour = col_text,
                                  margin = margin(b = 4)))

# =============================================================================
# Combine and save
# =============================================================================

p_combined <- p_med + p_conf + p_both +
  plot_layout(ncol = 3) &
  theme(plot.background = element_rect(fill = "white", colour = NA))

ggsave(
  here("sessions/session_06/figures/dag-healthcare.png"),
  p_combined,
  width = 15, height = 4.5, dpi = 180, bg = "white"
)
message("Saved: figures/dag-healthcare.png")
