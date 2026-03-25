source("R/000000_THEME_clean_light.R", echo = TRUE)

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
    title = "Scatter Plot",
    subtitle = paste0("Datensatz: ",datafile),
     x = paste0("Messgröße in ",xEinheit),
     y = paste0("Messsignal in ", yEinheit),
     caption = paste0(today, " | ", author)
  ) +
  
  # Achsenskalierung anpassen
  scale_x_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(dataset$x) + min(dataset$x))) +
  scale_y_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(dataset$y) + min(dataset$y))) +

  # Theme anwenden
  theme_clean_light(grid = "xy")

print(scatterplot)