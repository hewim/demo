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

# Dateiname ohne csv-Endung
datafile <- "exam_B223"

# Verzeichis
directory <- "data/exam/"

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

# Scatterplot mit Regressionsgerade | Aufgabe D.1
source("R/005010_Scatterplot_mit_Regressionsgerade_ggplot.R", echo = TRUE)

# Residuenplot | Aufgabe D.1
source("R/005110_Residuenplot_einfach_ggplot.R", echo = TRUE)

# Über die Reststandardabweichung normierte Residuen | Aufgabe D.2
source("R/005210_Residuenplot_normiert_ggplot.R", echo = TRUE)

# Über die Hebelwirkungsscore normierte Residuen | Aufgabe D.3
source("R/005310_Residuenplot_studentisiert_ggplot.R", echo = TRUE)

# Linearitätsprüfung
source("R/006000_Linearitaetspruefung.R", echo = TRUE)

# Ausreißerdiagnose
source("R/007000_Ausreissertests.R", echo = TRUE)