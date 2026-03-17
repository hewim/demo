# Workspace bereinigen!
rm(list = ls(all.names = TRUE))

# geöffnete Grafen schließen
graphics.off()

# Lösche Konsole
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

# Dateiname
datafile <- "experiment_1a"

# Verzeichis
directory <- "data/raw"

# Einheit der x-Variable
xEinheit <- "mg/dL"

# Einheit der y-Variable
yEinheit <- "E"

# Einlesefunktion
source("R/001000_Einlesen.R", echo = TRUE)

# Grundkalibrierung | Aufgabe A
source("R/002000_Grundkalibrierung.R", echo = TRUE)

# Gütekriterien | Aufgabe B
source("R/003000_Guetekriterien.R", echo = TRUE)

# Konfidenz- & Prädiktionsintervalle | Aufgabe C
source("R/004000_Konfidenz_und_Praediktionsintervalle.R", echo = TRUE)

# Scatterplot mit Regressionsgerade | Aufgabe D
source("R/005000_Scatterplot_mit Regressionsgerade.R", echo = TRUE)

