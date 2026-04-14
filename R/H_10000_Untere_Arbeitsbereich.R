
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# Title: Aufgabe F.5 -  Absicherung des unteren Arbeitsbereichs
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-03-27
# letzte Änderung:  2026-03-27
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# Quantile | kritische T-Werte für 95%  
t_Wert.1 <- qt(0.95, n-2)    # einseitig
t_Wert.2 <- qt(0.975, n-2)   # zweiseitig  

# kritischer Wert
yC <- a_1 + Syx_1 * t_Wert.1 * sqrt(1 + 1 / n + xMean ^ 2 / Qxx)

#kritischer Wert mit der Analysenfunktion in Konzentration umgerechnet
xC <- 2 * (yC - a_1) / b_1

# unterer Arbeitsbereich gilt als gesichert, wenn diese kleinste Konzentration
# unter dem Kalibrator mit der geringsten Konzentration liegt
# Arbeitsbereichsgrenze_gesichert = TRUE
Arbeitsbereichsgrenze_gesichert <-  xC < min(dataset$x)

# Anzeigen der Variableninhalte in der Konsole
Arbeitsbereichsgrenze_gesichert

# wenn xC < x1 gilt der gewaehlte Arbeitsbereich als statistisch abgesichert,
# d.h. die untere Grenze des Arbeitsbereichs unterschiedet sich signifikant
# von der Konzentration null

# wenn xC > x1 , unterscheidet sich x1 nicht signifikant von der Konzentration
# null und der Arbeitsbereich ist erst ab einer Konzentration von > xC abgesichert
# --> ab dieser Konzentration erst quantitative Analysen moeglich.
# Ist das der Fall, muesste neu kalibriert werden oder einzelne Verfahrensschritte
# ueberprueft und verbessert werden.

