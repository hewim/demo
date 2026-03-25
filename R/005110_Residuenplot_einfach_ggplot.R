source("R/000000_THEME_clean_light.R", echo = TRUE)

residualplot <- ggplot(dataset, aes(x = x, y = res_1)) +
  
  # Regressionslinie hinzufügen
  geom_hline(
    yintercept = 0, 
    color = "cornflowerblue"
  ) +
  
  # unteres Konfidenzintervall hinzufügen
  geom_hline(
    yintercept = -t_Wert.2 * Syx_1, 
    linetype = "dashed", 
    color = "gray70"
  ) +

  # oberes Konfidenzintervall hinzufügen
  geom_hline(
    yintercept = t_Wert.2 * Syx_1, 
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
    title = "Residuen Plot",
    subtitle = paste0("Datensatz: ",datafile),
     x = paste0("Messgröße in ",xEinheit),
     y = paste0("Residualabstände in ", yEinheit),
     caption = paste0(today, " | ", author)
  ) +
  
  # Achsenskalierung anpassen
  scale_x_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(dataset$x) + min(dataset$x))) +
  scale_y_continuous(n.breaks = 6, expand = c(0,0), limits = c(-1.5 * t_Wert.2 * Syx_1, 1.5 * t_Wert.2 * Syx_1)) +

  # Theme anwenden
  theme_clean_light(grid = "xy")

# Plotte anzeigen
print(residualplot)