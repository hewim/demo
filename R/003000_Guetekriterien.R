
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# 003000_Guetekriterien
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable/n:
# dataset$x, dataset$y, b_1, a_1,

# berechnet wird/werden die Variable/n:
# datset$fit_1, dataset$res_1, Syx.1, Sxo.1, Vxo.1, TSS, ESS, RSS, r2_1
# GOF.crit, GOF.emp



# B_1. Reststandardabweichung ---------------------------------------------
# Die Restandardabweichung zeigt den Kalibrierfehler an


# Eintragen der "gefitteten" Werte in die Variable dataset - Kalibrierfunktion
dataset$fit_1 <- a_1 + b_1 * dataset$x
# Anzeigen der Variableninhalte in der Konsole
dataset


# Eintragen der Residuen in die Variable dataset, auch RSS
dataset$res_1 <- dataset$y - dataset$fit_1
# Runden der Werte auf drei Stellen
# dataset$res_1 <- round(dataset$res_1, digits = 3)
# Anzeigen der Variableninhalte in der Konsole
dataset


# Je größer die Reststandardabweichung ist, um so mehr streuen die Residuen, 
# d. h. desto geringer ist die Präzision der linearen Regression. Im Idealfall, 
# wenn alle Wertepaare auf der Regressionsgeraden liegen würden, wäre die 
# Reststandardabweichung Syx = 0.


# Reststandardabweichung ... Standardabweichung der y-Werte
Syx_1 <- sqrt(sum(dataset$res_1^2)/(n-2))
# Anzeigen der Variableninhalte in der Konsole
Syx_1




# B.2. Verfahrensstandardabweichung ----------------------------------------
# Verfahrensstandardabweichung auch analytische Fehler, zeigt den zufälligen 
# Fehler des analytischen Prozesses


# Verfahrensstandardabweichung
Sxo_1 <- Syx_1/b_1
# Anzeigen der Variableninhalte in der Konsole
Sxo_1




# B.3. Verfahrensvariationskoeffizient ------------------------------------


# Verfahrensvariationskoeffizient
Vxo_1 <- (Sxo_1/xMean)*100
# Anzeigen der Variableninhalte in der Konsole
Vxo_1




# B.4. Bestimmtheitsmaß ---------------------------------------------------


# Quadratsumme Qyy
# Qyy <- sum(dataset$y^2)-(sum(dataset$y)^2/n) 
# oder: sum((dataset$y-yMean)^2)
# Anzeigen der Variableninhalte in der Konsole
# Qyy


# Korrelationskoeffizient
# r.1 <- Qxy/sqrt(Qxx*Qyy)
# Anzeigen der Variableninhalte in der Konsole
# r.1


# Berechnung der Steigung auch möglich über:
# r.1 * sd(dataset$y)/sd(dataset$x)


# Explained Sum of Squares - Summe der Quadrate der erklärbaren Abweichungen
ESS <- sum((dataset$fit_1 - mean(dataset$y))^2)
# Anzeigen der Variableninhalte in der Konsole
ESS


# Total Sum of Squares - Summe der Quadrate der Totalen Abweichungen
TSS <- sum((dataset$y - mean(dataset$y))^2)
# Anzeigen der Variableninhalte in der Konsole
TSS


# Residual Sum of Squares  - Summe der Residuenquadrate
RSS <- sum(dataset$res_1^2)
# Anzeigen der Variableninhalte in der Konsole
RSS


# Bestimmtheitsmaß: Aussage über das Modell, 
# nur im Rahmen der benutzten Stichprobe (!)
# ESS / TSS = sollte Nahe 1 sein
r2_1 <- ESS/TSS
# r2_1 <- sum((dataset$fit_1-yMean)^2) / sum((dataset$y-yMean)^2)
# auch der quadrierte Korrelationskoeffizient#
# r2_1 <- r.1^2
# Anzeigen der Variableninhalte in der Konsole
r2_1


# der Korrelationskoeffizient ein Maß für die Beziehung zwischen zwei 
# Variablen ist, gibt das Bestimmtheitsmaß (Determinationskoeffizient) 
# Aufschluss darüber, wie viel Varianz durch die Regression erklärt wird.
# https://de.wikipedia.org/wiki/Anscombe-Quartett




# B.5. GOF-Test zur Prüfung des Erklärungsgehalts -------------------------

# H0: es gibt keinen Koeffizienten größer 0
# H1: es gibt mindestens einen Koeffizienten größer 0

# Teststatistik
# GOF.emp <- sum((dataset$fit_1-yMean)^2) / sum((dataset$y-dataset$fit_1)^2) * (n-2)

# einfachere Formel
GOF_TS <- ESS / RSS * (n-2)

# Referenzstatistik: kritischer Wert
GOF_RS<- qf(0.95, 1, n-2)

# Frage: Ist die Prüfgröße größer als der kritische Wert?
GOF_Erklaerungsgehalt <- GOF_TS > GOF_RS
# Wenn TRUE, dann ist die Regression signifikant, d. h. es gibt einen Koeffizienten 
# größer 0, der die Varianz der y-Werte erklärt.


# B.6. Leverage Score ------------------------------------------------------

# Der Leverage-Score, der von 0 bis 1 variiert, misst den Betrag, um den sich
# der vorhergesagte Wert x ändern würde, wenn die Beobachtung y um eine Einheit 
# in y-Richtung verschoben würde.
dataset$h <- 1/n + (dataset$x-xMean)^2 / Qxx



# B.7. PRESS --------------------------------------------------------------

# Kontainer für die Variable
PRESS_linear <- 0

for (i in 1:length(dataset$x)) {
  
  # keweils eine Zeile wird aus dem Datensatz gelöscht
  dataset_corr <- dataset[-i,]
  
  # Lineare Funktion des korrigierten Datensatzes
  linear_model_corr <- lm(dataset_corr$y~dataset_corr$x)
  
  # geschätztes y für den gelöschten Wert
  y_corr <- linear_model_corr$coefficients[[1]] + linear_model_corr$coefficients[[2]]  * dataset$x[i]
  
  # Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
  PRESS_linear <- PRESS_linear + (dataset$y[i] - y_corr)^2
}

