
# Daten laden -------------------------------------------------------------

# die Funktion liest eine CSV-Datei ein und übergibt die Daten der Variable
# dataset als data.frame

dataset <- read.table(
  paste0(directory, "/", datafile, ".csv"),        # Dateipfad mit Variablen
  sep = ";",                                       # Spaltentrenner
  header = TRUE,                                   # Uebershrift ja/nein
  dec = ","                                        # Dezimaltrenner   
)
