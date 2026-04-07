
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# E_30000_Modifizierter_Trendtest_Neumann.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# dataset

# berechnet wird/werden die Variable(n):
# Steigungen, Neumann_TS, Neumann_RS, Linear.3

# Berechnung der Steigungen
Steigungen <- diff(dataset$y)/diff(dataset$x)

# Berechnung des Prüfgröße
Neumann_TS <- sum(diff(Steigungen) ^ 2) / (sum(Steigungen ^ 2) - (sum(Steigungen)) ^ 2 / (n - 1))

source("R/E_30001_Tabelle_Neumann.R", echo = TRUE)

# Frage: Ist die Teststatistik größer(!) als Rerefnzstatistik?
# Wenn TRUE, dann linear
Linear.3 <- Neumann_TS > Neumann_RS
