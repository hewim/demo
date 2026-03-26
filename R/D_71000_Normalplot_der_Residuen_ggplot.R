# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# D_71000_Normalplot_der_Residuen_ggplot.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-03-09
# letzte Änderung:  2026-03-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# dataset, xMean, yMean, b_1, a_1, xEinheit, yEinheit, datafile, today, author
# dataet_new, CI_upr, CI_lwr, res_1, t_Wert.2, Syx_1

# berechnet wird/werden die Variable(n):
# residualplot_studentisiert

source("R/000000_theme_hcw.R", echo = TRUE)

# zuerst die Residuen in aufsteigender Reihenfolge sortieren
res_norm <- sort(dataset$res_1)

# passende Quantile der Normalverteilung 
i <- 1 : n
fi <- (i - 0.5) / n
x_norm <- qnorm(fi)

dataset_norm<- data.frame(x_norm = x_norm, res_norm = res_norm)

# Finde das 1. und 3. Quartil für der Residuen
y_norm <- quantile(res_norm, c(0.25, 0.75), type = 5)

# Finde das 1. und 3. Quartil der Normalverteilung
x_norm <- qnorm( c(0.25, 0.75))

# Nun kann die Linie zwischen diesen Punkten berechnet werden
# Steigung
slope_norm <- diff(y_norm) / diff(x_norm)
# Schnittpunkt
int_norm   <- y_norm[1] - slope_norm * x_norm[1]

normalplot <- ggplot(dataset_norm, aes(x = x_norm, y = res_norm)) +
  
  # Regressionslinie hinzufügen
  geom_abline(
    intercept = int_norm,
    slope = slope_norm,
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
    title = "Normalverteilungsplot (QQ-Plot) der Residuen",
    subtitle = paste0("Datensatz: ",datafile),
     x = "theoretische Quantile",
     y = paste0("Residualabstände in ", yEinheit),
     caption = paste0(today, " | ", author)
  ) +
  
  # Achsenskalierung anpassen
  scale_x_continuous(n.breaks = 10, limits = c(-3,+3) ) +
  scale_y_continuous(n.breaks = 8, limits = c(-3*max(dataset_norm$res_norm), 3*max(dataset_norm$res_norm))) +

  # Theme anwenden
  theme_hcw(grid = "xy")

# Plotte anzeigen
print(normalplot)

