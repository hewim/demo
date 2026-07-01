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
# Erstellungsdatum: 2026-04-09
# letzte Änderung:  2026-04-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# Dateiname ohne csv-Endung
datafile <- "exam_Z804"

# Verzeichis
directory <- "data/exam"

# Einheit der x-Variable
xEinheit <- "g/mL"

# Einheit der y-Variable
yEinheit <- "E"

# Einlesefunktion
source("R/001000_Einlesen.R", echo = TRUE)


# Index der Messungen
dataset$i <- 1:nrow(dataset)



# Zeitstabilität: Trendtest
 source("R/L_20000_Zeitstabilitaet_Trend.R", echo = TRUE)

# Zeitstabilität: Trendtest - Grafische Darstellung
 source("R/L_21000_Zeitstabilitaet_Trend_Graf.R", echo = TRUE)

