
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# E_20000_Mandeltest.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# vorausgesetzt wird/werden die Variable(n):
# Syx_1, Syx_2

# berechnet wird/werden die Variable(n):
# Linear.2, Mandel_TS, Mandel_p, Mandel_RS

source("R/E_10000_Einfacher_Vergleich_der_Reststandardabweichungen.R", echo = TRUE)

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

