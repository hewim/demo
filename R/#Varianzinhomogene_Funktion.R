set <- 923

set.seed(set)

# x-Werte
x <- seq(1, 10, length.out = 10)

# heteroskedastische Fehler: Varianz steigt mit x
errors <-rnorm(10, sd = x^1.5 * 0.1)

# lineares Modell + heteroskedastische Fehler
y <- signif((exp(0.2 * x) + errors)/10, digits = 3)

df <- data.frame(x, y)
df


plot(df$x, df$y, main = "Nichtlineare Beziehung", xlab = "x", ylab = "y", pch = 16)

# save as csv
write.csv2(df, paste0(directory,"exam_B",set,".csv"), row.names = T)