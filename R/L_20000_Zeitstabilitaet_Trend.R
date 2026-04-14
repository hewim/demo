
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# K_20000_Zeitstabilitaert_Trend.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-04-09
# letzte Änderung:  2026-04-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# Stichprobenanzahl
n <- nrow(dataset)

# sukzessive Streuung
delta.2 <- sum(diff(dataset$x)^2) / (n-1) 

# Berechnung des PG-Trends
PG_Trend <- delta.2 / var(dataset$x)

# Auslesen des kritischen Tabellenwerts von Neumann

n_Neumann <- n
source("R/E_30001_Tabelle_Neumann.R", echo = TRUE)

# Frage: Ist die Prüfgröße kleiner(!) gleich als der kritische Tabellenwert
# Wenn TRUE, dann EIN Trend
Trend<- PG_Trend <= Neumann_RS

# Anzeigen der Variableninhalte in der Konsole
Trend