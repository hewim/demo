source("R/000000_THEME_clean_light.R", echo = TRUE)

# Über die Hebelwirkungsscore normierte Residuen
dataset$res_1_student <- dataset$res_1/(Syx_1 * sqrt(1-dataset$h))

residualplot_studentisiert <- ggplot(dataset, aes(x = x, y = res_1_student)) +
  
  # Regressionslinie hinzufügen
  geom_hline(
    yintercept = 0, 
    color = "cornflowerblue"
  ) +
  
  # unteres Konfidenzintervall hinzufügen
  geom_hline(
    yintercept = -1.96, 
    linetype = "dashed", 
    color = "gray70"
  ) +

  # oberes Konfidenzintervall hinzufügen
  geom_hline(
    yintercept = 1.96, 
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
    title = "Studentisierter Residuen Plot",
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
print(residualplot_studentisiert)