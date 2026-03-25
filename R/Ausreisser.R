set <- 923

set.seed(set)   # für Reproduzierbarkeit

# x-Werte
x <- seq(1, 10, length.out = 10)

# nichtlineare Funktion (z.B. quadratisch) + Rauschen
y <- signif((2 + 0.6 * x + rnorm(10, sd = 0.3))/10, digits = 2)

# Zufällige Position für den Ausreißer
pos <- sample(1:10, 1)

# Schwacher Ausreißer hinzufügen (z. B. leichte Abweichung)
y[pos] <- y[pos] + (runif(1, 0.5, 1.5) / 10)


# Dataframe
df <- data.frame(x, y)
df

plot(df$x, df$y, main = "Ausreisser", xlab = "x", ylab = "y", pch = 16)

# save as csv
write.csv2(df, paste0(directory,"exam_C",set,".csv"), row.names = T)