
# Fehlerniveau in %
Neumann_p <- 95

# mit paste0() zu einem Character "zusammengeklebt"
Neumann_p <- paste0("p",Neumann_p)

# Tabelle mit den kritischen Werten einlesen, wenn unterschiedlich 
# Wahrscheinlichkeiten gewünscht
Neumann_Tabelle <- read.csv2("data/tables/neumann_grenzen.csv")

# kritischer Wert aus der Tabelle
# sucht den Wert in Spalte mit Überschrift p (p95,p99,p99.9) un der Zeile
# n-1 Freiheitsgraden
# data.frame [zeile, spalte]
Neumann_RS <- Neumann_Tabelle[Neumann_Tabelle$n==n-1,colnames(Neumann_Tabelle)==Neumann_p]

