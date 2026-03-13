
# Daten laden -------------------------------------------------------------

# die Funktion liest eine CSV-Datei ein und übergibt die Daten der Variable
# dataset als data.frame

dataset <- read.table(
  #"data/experiment_1.csv",                        # Dateipfad Beispiel
  paste0(directory, "/", datafile, ".csv"),        # Dateipfad mit Variablen
  sep = ";",                                       # Spaltentrenner
  header = TRUE,                                   # Uebershrift ja/nein
  dec = ","                                        # Dezimaltrenner   
)

# Anzeigen der Variable in der Konsole (praktisch bei der Entwicklung)
dataset