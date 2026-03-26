
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# D_31000_Normierter_Residuenplot_ggplot.R
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
# residualplot_normiert

source("R/000000_theme_hcw.R", echo = TRUE)

# Über die Reststandardabweichung normierte Residuen
dataset$res_1_norm <- dataset$res_1/Syx_1
# Runden der Werte auf zwei Stellen
dataset$res_1_norm <- round(dataset$res_1_norm, digits = 2)

residualplot_normiert <- ggplot(dataset, aes(x = x, y = res_1_norm)) +
  
  # Regressionslinie hinzufügen
  geom_hline(
    yintercept = 0, 
    color = "cornflowerblue"
  ) +
  
  # unteres Konfidenzintervall hinzufügen
  geom_hline(
    yintercept = -t_Wert.2, 
    linetype = "dashed", 
    color = "gray70"
  ) +

  # oberes Konfidenzintervall hinzufügen
  geom_hline(
    yintercept = t_Wert.2, 
    linetype = "dashed", 
    color = "gray70"
  ) +


  # Datenpunkte hinzufügen
  geom_point(
    pch = 21,
    fill = "white",
    size = 3,
  ) +
  
  # Achsentitel und Plottitel hinzufügen
  labs(
    title = "Normierter Residuen Plot",
    subtitle = paste0("Datensatz: ",datafile),
     x = paste0("Messgröße in ",xEinheit),
     y = "Residualabstände in Standardabweichungseinheiten",
     caption = paste0(today, " | ", author)
  ) +
  
  # Achsenskalierung anpassen
  scale_x_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(dataset$x) + min(dataset$x))) +
  scale_y_continuous(n.breaks = 8, expand = c(0,0), limits = c(-4, 4)) +

  # Theme anwenden
  theme_hcw(grid = "xy")

# Plotte anzeigen
print(residualplot_normiert)