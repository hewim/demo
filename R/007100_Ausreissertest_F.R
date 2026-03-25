
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=


# Ausreißer mittels Scatterplot bestimmen und hier eintragen
ausreisser <- 8

# für dynamische Eliminierung
# dataset[abs(dataset$res.1) == max(abs(dataset$res.1)),]

# Wert(e) aus Datensatz löschen
dataset_cor <- dataset[-ausreisser,] #löscht 8 Zeile (row) bzw. in Ausreisser angegeben

# Lineare Funktion des korrigierten Datensatzes
LinReg.1_cor <- lm(dataset_cor$y~dataset_cor$x)
# Anzeigen der Variableninhalte in der Console
summary(LinReg.1_cor)

# y-Achsenschnittpunkt der korrigierten Funktion
a.1_cor <- LinReg.1_cor$coefficients[[1]]
# Anzeigen der Variableninhalte in der Console
a.1_cor 

# Steigung der korrigierten Funktion
b.1_cor <- LinReg.1_cor$coefficients[[2]]
# Anzeigen der Variableninhalte in der Console
b.1_cor 

n_cor <- length(dataset_cor$x)

# Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
Syx_1_cor <- sqrt(sum(LinReg.1_cor$residuals^2)/(n_cor-2))
# Anzeigen der Variableninhalte in der Console
round(Syx_1_cor, digits = 5)

# Prüfwert für den Ausreißertest
Ausreisser_TS<- (Syx_1^2*(n-2)-Syx_1_cor^2*(n_cor-2))/Syx_1_cor^2
# Anzeigen der Variableninhalte in der Konsole
Ausreisser_TS

# kritischer F-Wert für 99% und 1 bzw. N-2 Freiheitsgrade der korrigierten Werte
Ausreisser_RS <- qf(0.99,1,n_cor-2)
# Anzeigen der Variableninhalte in der Konsole
Ausreisser_RS

# Diese Modifikation des F-Tests hat den Vorzug, daß TS nicht
# durch die verschiedenen Freiheitsgrade beeinflußt wird, was bei
# kleinem N stark ins Gewicht fallen würde

# Frage: Ist der Prüfwert größer als der kritische Wert
# wenn TRUE, dann Ausreißer
Ausreisser_F <- Ausreisser_TS > Ausreisser_RS
# Anzeigen der Variableninhalte in der Konsole
Ausreisser_F