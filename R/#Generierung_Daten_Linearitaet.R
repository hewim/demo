buchstabe <- "A"
set <- 923
anzahl <- 10
directory <- "data/exam"

# Reproduzierbarkeit
set.seed(set)

x <- seq(1, anzahl, 1)

# Grundtrend (linear steigend)
trend <- (-0.05 * x^2 + x*5) / 100

# Zufällige Abweichung (Rauschen)
noise <- rnorm(anzahl, mean = 0.01, sd = 0.005)

# Finale Daten
df <- data.frame( x = x,  y = signif(trend+noise, digits = 3))


plot(seq(1,anzahl,1), df$x, main = "Ausreisser", xlab = "x", ylab = "y", pch = 16)

# save as csv
write.csv2(df, paste0(directory,"/exam_",buchstabe,set,".csv"), row.names = FALSE)