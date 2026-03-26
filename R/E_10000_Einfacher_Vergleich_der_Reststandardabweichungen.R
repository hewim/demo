
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# E_10000_Einfacher_Vergleich_der_Reststandardabweichungen.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# dataset, xMean, yMean, b_1, a_1, Qxx, Qxy, Syx_1

# berechnet wird/werden die Variable(n):
# Qx3, Qx4, Qx2y, c.2, b.2, a.2, Syx_2, Linear.1

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


