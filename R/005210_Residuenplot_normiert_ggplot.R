source("R/000000_THEME_clean_light.R", echo = TRUE)

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
  theme_clean_light(grid = "xy")

# Plotte anzeigen
print(residualplot_normiert)