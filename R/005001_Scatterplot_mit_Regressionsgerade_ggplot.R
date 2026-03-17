
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# Title: Aufgabe D.1 - Einfacher Satterplot mit GGPLOT
# Project: Mathematik 2 | Validierung analytischer Messdaten
# Author: Helge Wimmer
# Contact details: helge.wimmer@fh-campuswien.ac.at
# Date script created: 2020-10-01
# Date script last modified: 2024-03-01
# Version: 1.8
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

library(ggplot2)

# Scatterplot -------------------------------------------------------------

scatterplot_linear <- ggplot(data = dataset, mapping = aes(x,y)) + 
  geom_abline(intercept = a_1, slope = b_1, color="dodgerblue", linewidth = 0.5) +
  geom_point(shape = 21, fill = "white", color="gray40", size = 1.5, stroke = 0.5) +
  labs(
    title = "Scatterplot | linear", 
    y = paste("Messgröße [in ", yEinheit,"]",sep=""), ####
    x = paste0("Gehaltsgröße [in ", xEinheit,"]"), ####
    subtitle = paste("Datensatz:",file),
    caption = paste("© ", today, " | ", author, sep="")
  ) +
  scale_x_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(df$x) + min(df$x))) +
  scale_y_continuous(n.breaks = 10, expand = c(0,0), limits = c(0,max(df$y) + min(df$y))) +
  #expand_limits(x = 0, y = 0) +
  theme_fhcw()

print(scatterplot_linear)

# Name des "Output-Ordners"
figsDir <- "output"

# wenn der "Output-Ordners" nicht vorhanden, erstellen
ifelse(!dir.exists(file.path(figsDir)), dir.create(file.path(figsDir)), FALSE)

subDir <- sub("[.]...$", "", file)

# wenn Verzeichnis fuer Datei nicht vorhanden, erstellen
ifelse(!dir.exists(file.path(figsDir, subDir)), dir.create(file.path(figsDir, subDir)), FALSE)

ggsave(
  filename = paste0(figsDir,"/",subDir,"/Einfacher_Scatterplot.pdf"), 
  plot = last_plot(),
  device = cairo_pdf,
  path = NULL,
  scale = 1,
  width = 20, 
  height = 20,
  units = "cm",
  dpi = 300,
  limitsize = T
)