
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# 006000_Linearitaetspruefung.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=


# 1. Vergleich der Reststandardabweichungen der  Kalibrierfunktionen -------

# ... prüft, ob die Regression 2.Ordnung (quadratische Regression) 
# besser ist als die Regression 1.Ordnung (lineare Regression). 
# Zur Prüfung werden die Reststandardabweichungen aus beiden berechnet.

# Quadratsummen fuer die Kalibrierung 2.Grades
Qx3 <- sum(dataset$x ^ 3) - (sum(dataset$x) * sum(dataset$x ^ 2) / n)
Qx4 <- sum(dataset$x ^ 4) - (sum(dataset$x ^ 2) ^ 2) / n
Qx2y <-
  sum(dataset$x ^ 2 * dataset$y) - (sum(dataset$y) * sum(dataset$x ^ 2) / n)

# Polynomkoeffizienten der Kalibrierfunktion 2.Ordnung:
c.2 <- (Qxy * Qx3 - Qx2y * Qxx) / ((Qx3) ^ 2 - Qxx * Qx4)
b.2 <- (Qxy - c.2 * Qx3) / Qxx
a.2 <- yMean - b.2 * xMean - c.2 / n * sum(dataset$x ^ 2)

# Reststandardabweichung der Kalibrierfunktion 2.Ordnung
Syx_2 <-
  sqrt(1 / (n - 3) * (
    sum(dataset$y ^ 2) - a.2 * sum(dataset$y) - b.2 * sum(dataset$x * dataset$y) -
      c.2 * sum(dataset$x ^ 2 * dataset$y)
  ))

# Frage: Ist der Syx_1 kleiner oder gleich Syx_2?
# Wenn TRUE, dann linear
Linear.1 <- Syx_1 <= Syx_2




# 2. Mandel-Test -----------------------------------------------------------
# wenn Reststandardabweichungen gegeben sind
# Syx_1 <- 0.01476
# Syx_2 <- 0.00975
# n <- 9

# Teststatistik für den Anpassungstest nach Mandel
Mandel_TS <- ((n - 2) * Syx_1 ^ 2 - (n - 3) * Syx_2 ^ 2) / Syx_2 ^ 2

# Fehlerniveau in %
Mandel_p <- 99

# kritischer Wert aus der F-Tabelle
Mandel_RS <- qf(Mandel_p / 100, 1, n - 3)

# Frage: Ist der Prüfgröße kleiner oder gleich dem kritischen Wert?
# Wenn TRUE, dann linear
Linear.2 <- Mandel_TS <= Mandel_RS




# 3. Trendtest nach Neumann ------------------------------------------------
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
