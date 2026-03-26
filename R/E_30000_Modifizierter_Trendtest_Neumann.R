
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

# Fehlerniveau in %
Neumann_p <- 95

# mit paste0() zu einem Character "zusammengeklebt"
Neumann_p <- paste0("p",Neumann_p)

# Tabelle mit den kritischen Werten einlesen, wenn unterschiedlich 
# Wahrscheinlichkeiten gewünscht
Neumann_Tabelle <- read.csv2("data/tables/neumann_grenzen.csv")

# Berechnung der Steigungen
Steigungen <- diff(dataset$y)/diff(dataset$x)

# Berechnung des Prüfgröße
Neumann_TS <- sum(diff(Steigungen) ^ 2) / (sum(Steigungen ^ 2) - (sum(Steigungen)) ^ 2 / (n - 1))

# kritischer Wert aus der Tabelle
# sucht den Wert in Spalte mit Überschrift p (p95,p99,p99.9) un der Zeile
# n-1 Freiheitsgraden
# data.frame [zeile, spalte]
Neumann_RS <- Neumann_Tabelle[Neumann_Tabelle$n==n-1,colnames(Neumann_Tabelle)==Neumann_p]

# Frage: Ist die Teststatistik größer(!) als Rerefnzstatistik?
# Wenn TRUE, dann linear
Linear.3 <- Neumann_TS > Neumann_RS
