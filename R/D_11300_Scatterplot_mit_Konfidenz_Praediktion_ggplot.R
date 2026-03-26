# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# D_11300_Scatterplot_mit_Konfidenz_Praediktion_ggplot.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-03-09
# letzte Änderung:  2026-03-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# dataset, xMean, yMean, b_1, a_1, xEinheit, yEinheit, datafile, today, author
# dataet_new, CI_upr, CI_lwr

# berechnet wird/werden die Variable(n):
# scatterplot

source("R/000000_theme_hcw.R", echo = TRUE)

scatterplot <- ggplot(dataset, aes(x = x, y = y)) +
  
  # Regressionslinie hinzufügen
  geom_abline(
    slope = b_1,
    intercept = a_1,
    color = "cornflowerblue"
  ) +
  
  # Datenpunkte hinzufügen
  geom_point(
    pch = 21,
    fill = "white",
    size = 3,
  ) +
  
  # Achsentitel und Plottitel hinzufügen
  labs(
    title = "Scatter Plot mit Konfidenz- und Prädiktionsintervall",
    subtitle = paste0("Datensatz: ",datafile),
     x = paste0("Messgröße in ",xEinheit),
     y = paste0("Messsignal in ", yEinheit),
     caption = paste0(today, " | ", author)
  ) +
  
  # Achsenskalierung anpassen
  scale_x_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(dataset$x) + min(dataset$x))) +
  scale_y_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(dataset$y) + min(dataset$y))) +

  # Theme anwenden
  theme_hcw(grid = "xy")


# T Konfidenzintervall hinzufügen
scatterplot +
  geom_line(
    data = dataset_new,
    aes(x = x, y = CI_upr),
    color = "gray70",
    lty = "dashed",
    size = 0.5
  ) +
  geom_line(
    data = dataset_new,
    aes(x = x, y = CI_lwr),
    color = "gray70",
    lty = "dashed",
    size = 0.5
  ) +

# Prädiktionsintervall hinzufügen
  geom_line(
    data = dataset_new,
    aes(x = x, y = PI_upr),
    color = "gray50",
    lty = 1,
    size = 0.5
  ) +
  geom_line(
    data = dataset_new,
    aes(x = x, y = PI_lwr),
    color = "gray50",
    lty = 1,
    size = 0.5
  ) 