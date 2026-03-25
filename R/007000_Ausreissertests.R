# leerer logischer Vektor
outlier_f <- logical()

# Schleife über die Länge des Vektors dataset, mit i als Laufvariable
for (i in 1:length(dataset$x)) {
  
  # korrigierter Datensatz
  dataset_corr <- dataset[-i,]
  
  # Stichprobenanzahl
  n_corr <- length(dataset_corr$x)
  
  # Lineare Funktion des korrigierten Datensatzes
  LinReg.1_corr <- lm(dataset_corr$y~dataset_corr$x)
  
  # Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
  Syx_1_corr <- sqrt(sum(LinReg.1_corr$residuals^2)/(length(dataset_corr$x)-2))
  
  # F-Test Prüfwert
  F_emp <- (Syx_1^2*(n-2)-Syx_1_corr^2*(n_corr-2))/Syx_1_corr^2
  
  # kritischer F-Wert für 99% und 1 bzw. N-2 Freiheitsgrade der korrigierten Werte
  F_corr <- qf(0.99,1,n_corr-2)
  
  # Frage: Ist der Prüfwert ausserhalb der kritischen Werte
  # wenn ja, dann TRUE in Variable outlier
  outlier_f[i] <- F_emp > F_corr
}

# wenn zumndest ein Wert ausserhalb der Grenzen, dann ausreißer = TRUE
ausreisser_f <- sum(outlier_f) > 0

# welcher Kalibrierwert gilt als Ausreisser
ausreisser_nr_f <- which(outlier_f)

outlier_t <- logical()
# Schleife über die Länge des Vektors dataset, mit i als Laufvariable
for (i in 1:length(dataset$x)) {
  
  # korrigierter Datensatz
  dataset_corr <- dataset[-i,]
  
  # Lineare Funktion des korrigierten Datensatzes
  LinReg.1_corr <- lm(dataset_corr$y~dataset_corr$x)
  
  # geschätztes y für den gelöschten Wert
  y_corr <- LinReg.1_corr$coefficients[[1]] + LinReg.1_corr$coefficients[[2]]  * dataset$x[i]
  
  # Reststandardabweichung ... Standardabweichung der y-Werte der korrigierten Funktion
  Syx_1_corr <- sqrt(sum(LinReg.1_corr$residuals^2)/(nrow(dataset_corr)-2))
  
  # Hilfsquadratsumme
  Qxx_corr <- sum((dataset_corr$x - mean(dataset_corr$x))^2)
  
  # Konfidenzintervall
  CI <- Syx_1_corr * qt(0.975,nrow(dataset_corr)-2) * sqrt(1 + 1/nrow(dataset_corr) + (dataset$x[i] - mean(dataset_corr$x))^2 / Qxx_corr)
  
  # Frage: Ist der Prüfwert ausserhalb der kritischen Werte
  # wenn ja, dann TRUE in Variable outlier
  outlier_t[i] <- dataset$y[i] < y_corr-CI | dataset$y[i]>y_corr+CI
}

# wenn zumndest ein Wert ausserhalb der Grenzen, dann ausreißer = TRUE
ausreisser_t <- sum(outlier_t) > 0

# welcher Kalibrierwert gilt als Ausreisser
ausreisser_nr_t <- which(outlier_t)