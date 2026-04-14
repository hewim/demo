
# Workspace bereinigen!
rm(list = ls(all.names = TRUE))

# geöffnete Grafen schließen
graphics.off()

# Lösche Konsole
cat("\014")  

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# J_10000_Leerwertmethode.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-03-27
# letzte Änderung:  2026-03-27
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

b_1 <- 0.0045

# Dateiname ohne csv-Endung
datafile <- "exam_L701"

# Verzeichis
directory <- "data/exam"

# Einlesefunktion
source("R/001000_Einlesen.R", echo = TRUE)

# Stichprobenanzahl mit Funktion nrow()
n <- nrow(dataset)

# 01. kritische Werte ----

# Quantile | kritische T-Werte für 95%  
t_Wert.1 <- qt(0.95, n-1)    # einseitig
t_Wert.2 <- qt(0.975, n-1)   # zweiseitig  

# 02. korrekte Berechnung ----

# Abstand vom Mittelwert zum kritischen Wert yC
delta_yL <- sd(dataset$y) * t_Wert.1 * sqrt(1 + 1/n)

# kritischer Wert yC
yCL <- mean(dataset$y) + delta_yL

# Nachweisgrenze
xNG <- (yCL - mean(dataset$y))/b_1

# Erfassungsgrenze
xEG <- 2 * xNG

# relative Ergebnisunsicherheit 1/k
k <- 3


# 03. Schnellschaetzung ----

Phi <- signif(t_Wert.1 * sqrt(1 + 1/n), digits = 2) ## 3 fuer 10 und 99%

# Schnellschaetzung | Nachweisgrenze

# Schnellschaetzung mit Faktor Phi Φ
xNG_s <- Phi * sd(dataset$y) / b_1

# Schnellschaetzung
xNG_S <- 3 * sd(dataset$y) / b_1



# Schnellschaetzung | Erfassunggrenze

# Schnellschaetzung mit Faktor Phi Φ
xEG_s <- Phi * sd(dataset$y) / b_1 * 2

# Schnellschaetzung
xEG_S <- 6 * sd(dataset$y) / b_1



# Schnellschaetzung | Bestimmungsgrenze

# Schnellschaetzung mit Faktor Phi Φ
xBG_s <- k *  Phi * sd(dataset$y) / b_1

# Schnellschaetzung
xBG_S <- 9 * sd(dataset$y) / b_1


