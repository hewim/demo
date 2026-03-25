set <- 123

set.seed(set)   # für Reproduzierbarkeit

# x-Werte
x <- seq(1, 10, length.out = 10)

# nichtlineare Funktion (z.B. quadratisch) + Rauschen
y <- signif((1 * x^2  - rnorm(1, sd = 2))/100, digits = 3)

# Dataframe
df <- data.frame(x, y)
df

plot(df$x, df$y, main = "Nichtlineare Beziehung", xlab = "x", ylab = "y", pch = 16)

# save as csv
write.csv2(df, paste0(directory,"exam_A",set,".csv"), row.names = T)