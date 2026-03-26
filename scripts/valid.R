# Workspace bereinigen!
rm(list = ls(all.names = TRUE))

# geöffnete Grafen schließen ???
graphics.off()

# Lösche Konsole ???
cat("\014") 

# heutiges Datum
today <- format(Sys.Date(), format = "%d.%m.%Y")

# Autor
author <- "hewim"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# Dateiname ohne csv-Endung
datafile <- "experiment_1b"

# Verzeichis
directory <- "data/raw"

# Einheit der x-Variable
xEinheit <- "g/mL"

# Einheit der y-Variable
yEinheit <- "E"

# Einlesefunktion
source("R/001000_Einlesen.R", echo = TRUE)

# Grundkalibrierung | Aufgabe A
source("R/A_10000_Grundkalibrierung.R", echo = TRUE)

# Gütekriterien | Aufgabe B
source("R/B_10000_Guetekriterien.R", echo = TRUE)

# Konfidenz- & Prädiktionsintervalle | Aufgabe C
source("R/C_10000_Konfidenz_und_Praediktionsintervalle.R", echo = TRUE)

# Scatterplot mit Regressionsgerade | Aufgabe D.1
source("R/D_11000_Scatterplot_ggplot.R", echo = TRUE)

# Scatterplot mit Regressionsgerade und Konfidenzintervall
source("R/D_11100_Scatterplot_mit_Konfidenz_ggplot.R", echo = TRUE)

# Scatterplot mit Regressionsgerade und F-Konfidenzintervall
source("R/D_11200_Scatterplot_mit_Konfidenz_F_ggplot.R", echo = TRUE)

# Scatterplot mit Regressionsgerade, Konfidenzintervall und Prädiktionsintervall
source("R/D_11300_Scatterplot_mit_Konfidenz_Praediktion_ggplot.R", echo = TRUE)

# Einfacher Residuenplot | Aufgabe D.2
source("R/D_21000_Einfacher_Residuenplot_ggplot.R", echo = TRUE)

# Normierter Residuenplot | Aufgabe D.3
source("R/D_31000_Normierter_Residuenplot_ggplot.R", echo = TRUE)

# Studentisierter Residuenplot | Aufgabe D.4
source("R/D_41000_Studentisierter_Residuenplot_ggplot.R", echo = TRUE)

# Normalplot der Residuen (QQ-Plot)
source("R/D_71000_Normalplot_der_Residuen_ggplot.R")

# Rechnerische Prüfung der Linearitätsannahme | Aufgabe E
source("R/E_00000_Pruefung_der_Lineritaet.R", echo = TRUE)
