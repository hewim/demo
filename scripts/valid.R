directory <- "data/raw"                              # Verzeichnis, in dem die Daten liegen
datafile <- "experiment_1a"                          # Name der Datei ohne Endung

dataset <- read.table(
    paste0(directory, "/", datafile, ".csv"),        # Dateipfad mit Variablen
    sep = ";",                                       # Spaltentrenner
    header = TRUE,                                   # Uebershrift ja/nein
    dec = ","                                        # Dezimaltrenner   
  )
