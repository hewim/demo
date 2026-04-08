
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

trendtestplot <- ggplot(dataset, aes(x = i, y = x.1)) +
  
  # Mittelwert hinzufügen
  geom_hline(
    yintercept = x.zMean, 
    linetype = "dashed", 
    color = "gray70"
  ) +
  
    # Datenpunkte hinzufügen
  geom_point(
    pch = 21,
    fill = "white",
    size = 2,
  ) +
  
     # Datenpunkte hinzufügen
  geom_point(aes(x = i, y = x.2),
    pch = 21,
    fill = "grey90",
    size = 2,
  ) +
 
  # Achsentitel und Plottitel hinzufügen
  labs(
    title = "Zeitstabilität",
    subtitle = paste0("Datensatz: ",datafile),
     x = "Seriennummer der Messung",
     y = paste0("Messsignal in ", yEinheit),
     caption = paste0(today, " | ", author)
  ) +
  
  # Achsenskalierung anpassen
  scale_x_continuous(expand = c(0,0), limits = c(0,n+1)) +
  scale_y_continuous(expand = c(0,0), limits = c(x.zMean*0.8, x.zMean*1.2)) +

  # Theme anwenden
  theme_hcw(grid = "xy")

# Plotte anzeigen
print(trendtestplot)