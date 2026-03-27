set <- 323
anzahl <- 10 

set.seed(set)   # für Reproduzierbarkeit

# x-Werte
x <- seq(1, anzahl, length.out = anzahl)

# nichtlineare Funktion (z.B. quadratisch) + Rauschen
y <- signif((7-2 * x^2 - rnorm(anzahl, sd = 15))/100, digits = 2)


# Dataframe
df <- data.frame(x, y)
df

plot(df$x, df$y, main = "Ausreisser", xlab = "x", ylab = "y", pch = 16)

# save as csv
write.csv2(df, paste0(directory,"/exam_D",set,".csv"), row.names = T)