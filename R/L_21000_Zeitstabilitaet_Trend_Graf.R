
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# K_11000_Zeitstabilitaert_Graf.R
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
# residualplot

source("R/000000_theme_hcw.R", echo = TRUE)

trendtestplot <- ggplot(dataset, aes(x = i, y = x)) +
  
  # Mittelwert hinzufügen
  geom_hline(
    yintercept = mean(dataset$x), 
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
    title = "Trendtest",
    subtitle = paste0("Datensatz: ",datafile),
     x = "Seriennummer der Messung",
     y = paste0("Messsignal in ", yEinheit),
     caption = paste0(today, " | ", author)
  ) +

  
  # Achsenskalierung anpassen
  scale_x_continuous(expand = c(0,0), limits = c(0,n+1)) +
  scale_y_continuous(expand = c(0,0), limits = c(mean(dataset$x)*0.25, mean(dataset$x)*1.75)) +

  # Theme anwenden
  theme_hcw(grid = "xy")

# Plotte anzeigen
print(trendtestplot)