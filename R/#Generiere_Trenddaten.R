buchstabe <- "T"
set <- 123
anzahl <- 21
directory <- "data/exam"

# Reproduzierbarkeit
set.seed(set)


# Grundtrend (linear steigend)
trend <- seq(from = 0.100, to = 0.400, length.out = anzahl)

# Zufällige Abweichung (Rauschen)
noise <- rnorm(anzahl, mean = 0.5, sd = 0.1)

# Finale Daten
df <- data.frame( x = signif(trend + noise, digits = 3))


plot(seq(1,anzahl,1), df$x, main = "Ausreisser", xlab = "x", ylab = "y", pch = 16)

# save as csv
write.csv2(df, paste0(directory,"/exam_",buchstabe,set,".csv"), row.names = FALSE)