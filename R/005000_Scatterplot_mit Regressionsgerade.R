

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=
# 0060_Einfacher_Scatterplot
# Projekt: Mathematik 2 - SS2026
# E-mail: helge.wimmer@hcw.ac.at
# Erstellungsdatum: 2026-01-09
# letzte Änderung:  2026-01-09
# Version: 1.0
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=--=-=-=-=-=-=-=




# 01. Erste Ebene: das "Blatt Papier" -------------------------------------

# Abstände: unten - links - oben - rechts
par(mar = c(5.1, 5.1, 3.1, 2.1))

# Beginn des der plot()-Funktion
plot(
  # Merkmalsgrößen werden gegen die Messgößen aufgetragen
  dataset$x, dataset$y, ####
  # keine Anzeige der Daten
  type = "n",                        
  # keine Achsen Anzeigen
  axes = F,       
  # keine Beschriftung der x-Achse
  xlab = "",                                                 
  # keine Beschriftung der y-Achse
  ylab = "",        
  # Länge der x-Achse mit Verlängerung
  xlim=c(0, 2*xMean), ####
  # Länge der x-Achse mit Verlängerung
  ylim=c(0, 2*yMean), ####  
  # Achsen schneiden im 0-Punkt
  xaxs = "i", yaxs = "i"                
) 
# Ende der plot()-Funktion


# Gitternetzlinien
grid(
  #nx = 10, ny = 10,
  # Linientyp
  lty = 5,
  # Stärke der Regressionslinie
  lwd = 0.75,
  # Farbe der Umrandung
  col = "gray80"
)




# 02. Achsen --------------------------------------------------------------

# x-Achse: major
axis(
  # in x-Richtung 
  # (1 = unten, 2 = links, 3 = oben, 4 = rechts)
  side = 1,
  # Linientyp
  # (0 = leer, 1 =  solid, 2 = strichliert, 3 = punktiert, 4 = strichpunktiert, 5 = lange Striche, 6 = 2-Striche)
  lty = 1,
  # Farbe der Ticks
  col = "gray40",
  # Farbe der Beschriftung
  col.axis = "gray30",      
  # Ausrichtung der Labels
  las=1,
  # Größe der Beschriftung
  cex.axis=0.9,
  # Schriftart
  font=1,
  # Stärke der Achse
  lwd = 0,
  # Ausrichtung der Ticks
  tck=0.01,
  # Stärke der Ticks
  lwd.ticks = 1.2,
  # Abstände
  mgp=c(2,0.25,0)
)       

# y-Achse
axis(
  # in y-Richtung 
  side = 2,
  # Linientyp 
  lty = 1,
  # Farbe der Ticks
  col = "gray40",
  # Farbe der Beschriftung
  col.axis = "gray30",             
  # Ausrichtung der Labels
  las=1,
  # Größe der Beschriftung
  cex.axis=0.9,
  # Schriftart
  font=1,
  # Stärke der Achse
  lwd = 0,
  # Ausrichtung der Ticks
  tck=0.01,
  # Stärke der Ticks
  lwd.ticks = 1.2,
  # Abstände
  mgp=c(2,0.5,0)
)  




# 03. Beschriftung  -------------------------------------------------------

# Überschrift
title(
  # Titel
  main="Streudiagramm | Scatterplot", ####
  # Anordnung
  adj=1,
  # Farbe
  col.main = "gray30",       
  # Schriftgröße
  cex.main=1.2
)

# Unterüberschrift
title(
  # Titel = Dateinahme
  sub = datafile,
  # Anordnung
  adj=1,
  # Farbe
  col.sub = "gray40",
  # Schriftgröße
  cex.sub=0.7,
  # Position Linie 1-3
  line = 2.5
)

# x- Achse
title(
  # Beschriftung der x-Achse
  xlab = paste0("Gehaltsgröße [in ", xEinheit,"]"), ####
  # Anordnung
  adj=1,
  # Farbe der Achsenbeschriftung
  col.lab =  "gray40",
  # Schriftgröße der Achsenbeschriftung
  cex.lab=0.9,
  # Position Linie 1-3
  line = 1.5
)

# y-Achse
title(
  # Beschriftung der y-Achse
  ylab = paste("Messgröße [in ", yEinheit,"]",sep=""), ####
  # Anordnung
  adj=1,
  # Farbe der Achsenbeschriftung
  col.lab =  "gray40",
  # Schriftgröße der Achsenbeschriftung
  cex.lab=0.9,
  # Position Linie 1-3
  line = 3
)




# 04. Regressionslinie ----------------------------------------------------

abline(
  # y-Achsenschnittpunkt
  a = a_1,
  # Steigung
  b = b_1,
  # Farbe der Regressionslinie
  col = "cornflowerblue",
  # Stärke der Regressionslinie
  lwd = 1.5
)




# 05. Messpunkte ----------------------------------------------------------

points(
  # darzustellende Daten
  dataset$x,dataset$y, ####
  # Art der Punkte
  pch = 21,
  # Größe der Datenpunkte
  cex = 1.2,
  # Umrandung der Punkte
  col = "gray40",
  # Farbe der Punkte
  bg = "ghostwhite"
)




# 07. Umrandung des Plots -------------------------------------------------

box(
  # Linientyp
  lty = 1,
  # Linienbreite
  lwd = 1.2,
  # Farbe der Umrandung
  col = "gray30"
)




# 08. Copyright -----------------------------------------------------------

mtext(
  paste("© ", today, " | ", author, sep=""),
  adj = 0,
  side = 4,
  line = -0.1,
  col = "gray40",
  srt = 90,
  cex = 0.6
)
