# leere Variable für die Ergebnisse der F-Tests
outlier_f <- data.frame()

# Schleife über die Länge des Vektors dataset, mit i als Laufvariable
for (i in 1:length(dataset$x)) {
  
  # korrigierter Datensatz
  dataset_cor <- dataset[-i,]
  
  # Stichprobenanzahl
  n_cor <- length(dataset_cor$x)
  
  # Lineare Funktion des korrigierten Datensatzes
  LinReg.1_cor <- lm(dataset_cor$y~dataset_cor$x)
  
  # Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
  Syx_1_cor <- sqrt(sum(LinReg.1_cor$residuals^2)/(length(dataset_cor$x)-2))
  
  # F-Test Prüfwert
  Ausreisser_RS <- (Syx_1^2*(n-2)-Syx_1_cor^2*(n_cor-2))/Syx_1_cor^2
  
  # kritischer F-Wert für 99% und 1 bzw. N-2 Freiheitsgrade der korrigierten Werte
  Ausreisser_TS <- qf(0.99,1,n_cor-2)
  
  outlier_f <- rbind(outlier_f, data.frame(i, Ausreisser_RS, Ausreisser_TS, Syx_1_cor, ausreisser = Ausreisser_RS > Ausreisser_TS))
}

outlier_t <- data.frame()
# Schleife über die Länge des Vektors dataset, mit i als Laufvariable
for (i in 1:length(dataset$x)) {
  
  # korrigierter Datensatz
  dataset_cor <- dataset[-i,]
  
  # Lineare Funktion des korrigierten Datensatzes
  LinReg.1_cor <- lm(dataset_cor$y~dataset_cor$x)
  
  # geschätztes y für den gelöschten Wert
  y_cor <- LinReg.1_cor$coefficients[[1]] + LinReg.1_cor$coefficients[[2]]  * dataset$x[i]
  
  # Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
  Syx_1_cor <- sqrt(sum(LinReg.1_cor$residuals^2)/(nrow(dataset_cor)-2))
  
  # Hilfsquadratsumme
  Qxx_cor <- sum((dataset_cor$x - mean(dataset_cor$x))^2)
  
  # Konfidenzintervall
  CI <- Syx_1_cor * qt(0.975,nrow(dataset_cor)-2) * sqrt(1 + 1/nrow(dataset_cor) + (dataset$x[i] - mean(dataset_cor$x))^2 / Qxx_cor)
  
  outlier_t <- rbind(outlier_t, data.frame(i, unten=y_cor-CI,oben= y_cor+CI, x=dataset$y[i], ausreisser = dataset$y[i] < y_cor-CI | dataset$y[i]>y_cor+CI))
}