
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# Ausreißer mittels Scatterplot bestimmen und hier eintragen
ausreisser <- 8

# Wert(e) aus Datensatz löschen
dataset_cor <- dataset[-ausreisser,] #löscht 8 Zeile (row) bzw. in Ausreisser angegeben

# Lineare Funktion des korrigierten Datensatzes
LinReg.1_cor <- lm(dataset_cor$y~dataset_cor$x)

# y-Achsenschnittpunkt der korrigierten Funktion
a_1_cor <- LinReg.1_cor$coefficients[[1]]
# Anzeigen der Variableninhalte in der Console
a_1_cor 

# Steigung der korrigierten Funktion
b_1_cor <- LinReg.1_cor$coefficients[[2]]
# Anzeigen der Variableninhalte in der Console
b_1_cor 

# Stichprobenanzahl des korrigierten Datensatzes
n_cor <- length(dataset_cor$x)
# Anzeigen der Variableninhalte in der Console
n_cor

# Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
Syx_1_cor <- sqrt(sum(LinReg.1_cor$residuals^2)/(n_cor-2))
# Anzeigen der Variableninhalte in der Console
Syx_1_cor

# kritischer T-Wert für 95% und N-2 = 7 Freiheitsgrade, da nur mehr 9 Werte
Ausreisser_T_RS <- qt(0.975,n_cor-2) # zweiseitig
# Anzeigen der Variableninhalte in der Console
Ausreisser_T_RS

# geschätztes y für den gelöschten Wert
y_cor <- a_1_cor + b_1_cor * dataset$x[ausreisser]
# Anzeigen der Variableninhalte in der Console
y_cor

# Mittelwert der x-Werte des korrigierten Datensatzes
xMean_cor <- mean(dataset_cor$x)
# Anzeigen der Variableninhalte in der Console
xMean_cor

# Hilfsquadratsumme der x-Werte des korrigierten Datensatzes
Qxx_cor <- sum((dataset_cor$x - xMean_cor)^2)
# Anzeigen der Variableninhalte in der Console
Qxx_cor

# Konfidenzintervall
VB <- Syx_1_cor * Ausreisser_T_RS * sqrt(1 + 1/n_cor + (dataset$x[ausreisser] - xMean_cor)^2 / Qxx_cor)
# Anzeigen der Variableninhalte in der Konsole
VB

# Frage: Ist der Prüfwert ausserhalb der kritischen Werte
# wenn ja, dann Ausreißer
Aussreisser_T <- dataset$y[ausreisser] < y_cor-VB | dataset$y[ausreisser]>y_cor + VB
# Anzeigen der Variableninhalte in der Konsole
Aussreisser_T
