
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# J_20000_Kalibrierfunktionsverfahren.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-03-27
# letzte Änderung:  2026-03-27
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=


# 01. kritische Werte ----

# Quantile | kritische T-Werte für 95%  
t_Wert.1 <- qt(0.99, n-2)    # einseitig
t_Wert.2 <- qt(0.995, n-2)   # zweiseitig  

# 02. korrekte Berechnung ----

# Abstand vom Achsenschnittpunkt zum kritischen Wert yC
delta_a <- Syx_1 * t_Wert.1 * sqrt(1/1 + 1/n + xMean^2 / Qxx)

# kritischer Wert yC
yC <- a_1 + delta_a

# Nachweisgrenze
xNG <- (yC - a_1) / b_1

# Erfassungsgrenze
xEG <- 2 * xNG

# relative Ergebnisunsicherheit 1/k
k <- 3

# Bestimmungsgrenze
xBG <- k * Sxo_1 * t_Wert.2 * sqrt(1/1 + 1/n + ((k * xNG)-xMean)^2/Qxx)


# 03. Schnellschaetzung ----

Phi <- signif(t_Wert.1 * sqrt(1 + 1/n), digits = 2) ## 3 fuer 10 und 99%

# Schnellschaetzung | Nachweisgrenze

# Schnellschaetzung mit Faktor Phi Φ
xNG_s <- 1.2 * Phi * Sxo_1

# Schnellschaetzung
xNG_S <- 4 * Sxo_1



# Schnellschaetzung | Erfassunggrenze

# Schnellschaetzung mit Faktor Phi Φ
xEG_s <- 1.2 * Phi * Sxo_1 * 2

# Schnellschaetzung
xEG_S <- 8 * Sxo_1



# Schnellschaetzung | Bestimmungsgrenze

# Schnellschaetzung mit Faktor Phi Φ
xBG_s <- 1.2 * k *  Phi * Sxo_1

# Schnellschaetzung
xBG_S <- 11 * Sxo_1


# Das Verhältnis von errechneter Nachweisgrenze und höchstem Kalibrierwert überscchreitet nicht de Faktor 10
Varianzhomogenitaet_xNG <- max(dataset$x) / xNG <=10
