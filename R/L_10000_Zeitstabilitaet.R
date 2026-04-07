
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# K_10000_Zeitstabilitaet.R
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-04-09
# letzte Änderung:  2026-04-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=

# Stichprobenanzahl
n <- nrow(dataset)

# Zur Überprüfung der Zeitabhängigkeit werden zunächst Standardabweichungen 
# innerhalb der Serien, bestehend aus Mehrfach- oder Doppelbestimmungen, 
# berechnet:

# Freiheitsgrade und Standardabweichung der Mehrfach- oder Doppelbestimmungen
f.j <- length(dataset) - 1
dataset$s.j <- apply(dataset[,1:length(dataset)], 1,sd)

# Freiheitsgrade und Standardabweichung in der Serie
f.w <- length(dataset$x.1)     # within
s.w <- sqrt((1/f.w) * sum(f.j * dataset$s.j^2))

# Serienmittelwert
dataset$mean <- (dataset$x.1 + dataset$x.2)/2
# dataset $mean <- rowMeans(dataset)

# Mittelwert der Serienmittelwerte
# "der Mittelwert der Mittelwerte"
x.zMean <- mean(dataset$mean)

# Freiheitsgrade und Standardabweichung zwischen den Serien
f.b <- length(dataset$x.1) - 1 # between
s.b <- sqrt((1/f.b) * sum((dataset$mean - x.zMean)^2))

# Freiheitsgrade und Standardabweichung der Totalen
f.t <- f.b + f.w              
s.t <- sqrt((1/f.t)*(s.b^2 * f.b + s.w^2 * f.w))


# Prüfgröße
#PG_Zeit <- var.b/var.w
PG_Zeit <- s.b^2 / s.w^2


# kritischer Wert aus der F-Tabelle
p <- 99
RS.Zeit <- qf(p/100,f.b,f.w)

# Frage: Wird die Gesamtpräzision übermäßig stark durch den Zeitpunkt beeinflusst?
# Wenn TRUE, dann ja ...
Zeit.1 <- PG_Zeit > RS.Zeit

# Anzeigen der Variableninhalte in der Konsole
Zeit.1

# Im Allgemeinen ist die Standardabweichung zwischen den Serien größer als 
# die Standardabweichung innerhalb der Serien. Die Standardabweichung zwischen 
# den Serien sollte aber maximal nur doppelt so groß sein wie die 
# Standardabweichung innerhalb der Serien.

# PG ≤ F: Die Varianz var.b zwischen den Serien ist nur zufällig größer als die 
# Varianz var.w innerhalb der Serien.
# PG > F: Die Gesamtunpräzision wird durch die Unpräzision der Messwerte
# zwischen den Serien signifikant beeinflusst.