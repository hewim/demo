library(ggplot2)
library(grid)

theme_hcw <- function(
  base_size   = 12,
  base_family = "sans",
  compact     = FALSE,       # engeres Layout für Reports/Dashboards
  grid        = c("y", "xy", "x", "none"),
  accent      = "#3B82F6"    # Akzentfarbe (z.B. Blau)
) {

  grid <- match.arg(grid)

  # Farbpalette (hell, modern, CI-neutral)
  pal <- list(
    bg      = "#FFFFFF",
    panel   = "#FAFAFA",
    grid    = "#E5E7EB",
    axis    = "#374151",
    text    = "#111827",
    strip   = "#F3F4F6",
    legend  = "#FFFFFF"
  )

  th <- theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Hintergründe
      plot.background   = element_rect(fill = pal$bg,    colour = NA),
      panel.background  = element_rect(fill = pal$panel, colour = NA),
      legend.background = element_rect(fill = pal$legend,colour = NA),
      legend.key        = element_rect(fill = pal$panel, colour = NA),

      # Titel & Texte
      plot.title      = element_text(face = "bold", colour = pal$text, size = base_size * 1.25, hjust = 0),
      plot.subtitle   = element_text(colour = pal$text, size = base_size * 1.05, margin = margin(b = 6)),
      plot.caption    = element_text(colour = pal$axis, size = base_size * 0.85, hjust = 1, margin = margin(t = 6)),
      axis.title.x    = element_text(colour = pal$text, margin = margin(t = 6)),
      axis.title.y    = element_text(colour = pal$text, margin = margin(r = 6)),
      axis.text       = element_text(colour = pal$axis),

      # Achsenlinien / Ticks
      axis.line       = element_line(colour = pal$axis, linewidth = 0.4),
      axis.ticks      = element_line(colour = pal$axis, linewidth = 0.4),

      # Legende
      legend.position = "right",
      legend.title    = element_text(colour = pal$text, face = "bold"),
      legend.text     = element_text(colour = pal$axis),

      # Facets
      strip.background = element_rect(fill = pal$strip, colour = NA),
      strip.text       = element_text(colour = pal$text, face = "bold"),

      # Plotmargen
      plot.margin = margin(10, 12, 10, 12)
    )

  # Grid-Konfiguration
  grid_col <- pal$grid
  th <- th +
    theme(
      panel.grid.major.x = if (grid %in% c("x", "xy")) element_line(colour = grid_col, linewidth = 0.4) else element_blank(),
      panel.grid.major.y = if (grid %in% c("y", "xy")) element_line(colour = grid_col, linewidth = 0.4) else element_blank(),
      panel.grid.minor   = element_blank()
    )

  # Kompaktmodus (weniger Weißraum)
  if (compact) {
    th <- th +
      theme(
        legend.position   = "bottom",
        legend.key.size   = unit(10, "pt"),
        plot.title        = element_text(margin = margin(b = 2)),
        plot.subtitle     = element_text(margin = margin(b = 4)),
        plot.margin       = margin(6, 8, 6, 8),
        axis.title.x      = element_text(margin = margin(t = 4)),
        axis.title.y      = element_text(margin = margin(r = 4))
      )
  }

  attr(th, "accent") <- accent
  th
}