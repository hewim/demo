
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# 004000_Konfidenz_und_Praediktionsintervalle
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=


# vorausgesetzt wird/werden die Variable/n:
# n, Qxx, xMean, xEinheit, yEinheit

# berechnet wird/werden die Variable/n:
# t_Wert.1, t_Wert.2, Sb_1, CI_Sb_1, Sa_1, CI_Sa_1, PI_Sa_1, PI_x
# dataset$sy



# 01. kritische Werte -----------------------------------------------------

# Quantile | kritische T-Werte für 95%  
t_Wert.1 <- qt(0.95, n-2)    # einseitig
t_Wert.2 <- qt(0.975, n-2)   # zweiseitig  




# 02. Vertrauensbereich für die Steigung ----------------------------------

# Mit Hilfe des Konfidenz- oder Vertrauensintervalls der Steigung werden 
# Grenzen berechnet, in denen mit einer vorgegebenen Wahrscheinlichkeit 
# (z.B. zu 95%) der wahre Wert der Steigung liegt:

# Standardabweichung
Sb_1 <- Syx_1 / sqrt(Qxx) 
Sb_1

# Vertrauensbereich
CI_Sb_1 <-  Sb_1 * t_Wert.2
CI_Sb_1




# 03. Vertrauensbereich für den Achsenabschnitt ---------------------------

# # Mit Hilfe des Konfidenz- oder Vertrauensintervalls des Achsenabschnitts 
# werden Grenzen berechnet, in denen mit einer vorgegebenen Wahrscheinlichkeit 
# (z.B. zu 95%) der wahre Wert des Achsenabschnitts liegt:

# Standardabweichung
Sa_1 <- Syx_1 * sqrt(1/n + xMean^2/Qxx)
# oder
# Sa_1 <- Syx.1 * sqrt(sum(dataset$x^2)/(n* Qxx))

# Vertrauensbereich
CI_Sa_1 <- Sa_1 * t_Wert.2




# 04. Prädiktionsintervall ------------------------------------------------
PI_Sa_1 <- Syx_1 *  t_Wert.2*  sqrt(1/1 + 1/n + xMean^2/Qxx)

# Vertrauensbereich für das Ergebnis
PI_x <- Sxo_1 * t_Wert.2 * sqrt(1/1 + 1/n + (Messwert-yMean)^2/(b_1^2*Qxx))




# 05. Standardfehler ------------------------------------------------------

# Der Leverage Score wird verwendet, um den Standardfehler jeder Schätzung an 
# der Position x_i zu berechnen:
dataset$sy <- Syx_1 * sqrt(dataset$h) 


# 06. datensatz mit Konfidenz- und Prädiktionsintervallen -----------------

# x-Werte in data.frame von 0 bis zur Obergrenze
dataset_new <- data.frame(
  x = seq(0,
          ifelse(
            max(dataset$x) > 2*xMean,
            max(dataset$x) + min(dataset$x),
            2*xMean),
          # in folgenden Abständen: Range durch 400
          (max(max(dataset$x), 2* xMean) - min(dataset$x)) / 100
  )
)
# gefittete Werte berechnen
dataset_new$fit <- a_1+b_1*dataset_new$x

# "Nur" ein Konfidenzintervall auf Basis der t-Verteilung
dataset_new$KB_lwr <- dataset_new$fit - t_Wert.2 * Syx_1
dataset_new$KB_upr <- dataset_new$fit + t_Wert.2 * Syx_1

# Konfidenzintervall für die Regressionsgerade
dataset_new$CI_lwr <- dataset_new$fit - t_Wert.2 * Syx_1 * sqrt(1/n + (dataset_new$x-xMean)^2/Qxx)
dataset_new$CI_upr <- dataset_new$fit + t_Wert.2 * Syx_1 * sqrt(1/n + (dataset_new$x-xMean)^2/Qxx)

#Konfidenzintervall für die Regressionsgerade mit F-Statistik
dataset_new$CI_F_lwr <- dataset_new$fit - sqrt(qf(0.95, 2, n-2)) * Syx_1 * sqrt(1/n + (dataset_new$x-xMean)^2/Qxx)
dataset_new$CI_F_upr <- dataset_new$fit + sqrt(qf(0.95, 2, n-2)) * Syx_1 * sqrt(1/n + (dataset_new$x-xMean)^2/Qxx)

# Prädiktionsintervall für die Regressionsgerade
dataset_new$PI_lwr <- dataset_new$fit - t_Wert.2 * Syx_1 * sqrt(1 + 1/n + (dataset_new$x-xMean)^2/Qxx)
dataset_new$PI_upr <- dataset_new$fit + t_Wert.2 * Syx_1 * sqrt(1 + 1/n + (dataset_new$x-xMean)^2/Qxx)
