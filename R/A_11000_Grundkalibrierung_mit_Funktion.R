
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# A_11000_Grundkalibrierung_mit_Funktion.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# dataset

# Anzahl der Beobachtungen
n <- nrow(dataset)

# Reggression
regression <- function(df, x = "x", y="y") {
  xMean <- mean(df[[x]])
  yMean <- mean(df[[y]])
  Qxx <- sum((df[[x]] - xMean) ^ 2)
  Qxy <- sum((df[[x]]- xMean) * (df[[y]] - yMean))
  b_1 <- Qxy / Qxx
  a_1 <- yMean - b_1 * xMean
  return(list(xMean = xMean, yMean = yMean, Qxx = Qxx, Qxy= Qxy, a_1 = a_1, b_1 = b_1))
}

# Berechnung der Regressionsparameter
Lineare_Regression <- regression(dataset)