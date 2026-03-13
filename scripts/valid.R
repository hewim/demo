# Workspace bereinigen!
rm(list = ls(all.names = TRUE))

# geöffnete Grafen schließen
graphics.off()

# Lösche Konsole
cat("\014") 


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

source("R/001000_Einlesen_mit Funktion.R", echo = TRUE)