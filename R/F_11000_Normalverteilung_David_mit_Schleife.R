# Workspace bereinigen!
rm(list = ls(all.names = TRUE))

# geöffnete Grafen schließen
graphics.off()

# Lösche Konsole
cat("\014") 

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# 0081_Schnelltest_David_mit_Schleife
# Project: Mathematik 2 | Validierung analytischer Messdaten
# Author: Helge Wimmer
# Contact details: helge.wimmer@fh-campuswien.ac.at
# Date script created: 2020-10-01
# Date script last modified: 2024-03-11
# Version: 1.8
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# keine

# berechnet wird/werden:
# Normalverteilung

# Dateiname wird der Variabele datafile übergeben,
filename <- "experiment_3a"

# die sich in folgendem Verzeichnis befindet:
directory <- "data/raw"

# Daten laden -------------------------------------------------------------

# die Funktion liest eine CSV-Datei ein und übergibt die Daten der Variable
# dataset als data.frame

dataset <- read.table(
  #"data/experiment_3a.csv",                       # Dateipfad Beispiel
  paste0(directory, "/", filename, ".csv"),        # Dateipfad mit Variablen
  sep = ";",                                       # Spaltentrenner
  header = TRUE,                                   # Uebershrift ja/nein
  dec = ","                                        # Dezimaltrenner   
)



# F.1. Schnelltest auf Normalverteilung nach David ------------------------

# Laden der Tabelle mit den kritischen Werten für den Test nach David
TableDavid <- readRDS("data/tables/david_grenzen.rds")

# Wahrscheinlichkeit p95, p99, p99.9 als String
p_D <- 95
p_David <- paste0("p",p_D/100)

# Berechnung für jede Spalte im Datensatz
for(i in 1:ncol(dataset)){
  # jede Spalte
  col <- dataset[,i]
  # Berechnung des empirischen Werts
  G <- round((max(col) - min(col)) / sd(col), digits = 2)
  # untere Grenze
  Gu <- TableDavid$low[TableDavid$low$n == length(col),p_David]
  # obere Grenze
  Go <- TableDavid$up[TableDavid$up$n == length(col),p_David]
  
  ifelse(Gu<G && G<Go, 
         print(
           paste0(
             "Die Daten aus Spalte ",
             i,
             " sind auf einem Niveau von ",
             p_D,
             "% normalverteilt, da der empirische Wert von ",
             G,
             " zwischen den Grenzen ",
             Gu,
             " und ",
             Go,
             " liegt"
             )
           ), 
         print(
           paste0(
             "Die Daten aus Spalte ",
             i,
             " sind mit einer Irrtumswahrscheinlichkeit von ",
             100-p_D,
             " nicht normalverteilt"
             )
           )
  )
}
