# Workspace bereinigen!
rm(list = ls(all.names = TRUE))


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# F_10000_Normalverteilung_David.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# keine

# berechnet wird/werden:
# Normalverteilung

# Dateiname wird der Variabele datafile übergeben,
datafile <- "experiment_3a"

# die sich in folgendem Verzeichnis befindet:
directory <- "data/raw"

# Daten laden -------------------------------------------------------------

# die Funktion liest eine CSV-Datei ein und übergibt die Daten der Variable
# dataset als data.frame

# die Funktion liest eine CSV-Datei ein und übergibt die Daten der Variable
# dataset als data.frame

dataset <- read.table(
  paste0(directory, "/", datafile, ".csv"),        # Dateipfad mit Variablen
  sep = ";",                                       # Spaltentrenner
  header = TRUE,                                   # Uebershrift ja/nein
  dec = ","                                        # Dezimaltrenner   
)

# Laden der Tabelle mit den kritischen Werten für den Test nach David
TableDavid <- readRDS("data/tables/david_grenzen.rds")

# Wahrscheinlichkeit
p <- "p0.95"


# für den ersten Standard -------------------------------------------------

# Teststastik
G_y1 <- (max(dataset$y1)- min(dataset$y1))/sd(dataset$y1) 

# Vergleichsstatistik
# unten
U_1<- TableDavid$low[TableDavid$low$n == length(dataset$y1),p]
# oben
O_1<- TableDavid$up[TableDavid$up$n == length(dataset$y1),p ]

# normalverteilt?
Normalverteilt_x1 <- U_1 < G_y1 & G_y1 < O_1



# für den zweiten Standard ------------------------------------------------

# Teststatistik
G_y10 <- (max(dataset$y10)- min(dataset$y10))/sd(dataset$y10)

# Vergleichsstatistik
# unten
U_10 <- TableDavid$low[TableDavid$low$n==length(dataset$y10),p]
#oben
O_10<- TableDavid$up[TableDavid$up$n==length(dataset$y10),p]

# normalverteilt?
Normalverteilt_x10 <- U_10 < G_y10 & G_y10 < O_10


