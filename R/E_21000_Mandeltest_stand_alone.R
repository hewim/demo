
# Workspace bereinigen!
rm(list = ls(all.names = TRUE))

# geöffnete Grafen schließen ???
graphics.off()

# Lösche Konsole ???
cat("\014") 

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# E_21000_Mandeltest.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# wenn Reststandardabweichungen gegeben sind
Syx_1 <- 192.29
Syx_2 <- 204.45
n <- 6

# Teststatistik für den Anpassungstest nach Mandel
Mandel_TS <- ((n - 2) * Syx_1 ^ 2 - (n - 3) * Syx_2 ^ 2) / Syx_2 ^ 2

# Fehlerniveau in %
Mandel_p <- 99

# kritischer Wert aus der F-Tabelle
Mandel_RS <- qf(Mandel_p / 100, 1, n - 3)

# Frage: Ist der Prüfgröße kleiner oder gleich dem kritischen Wert?
# Wenn TRUE, dann linear
Linear.2 <- Mandel_TS <= Mandel_RS

