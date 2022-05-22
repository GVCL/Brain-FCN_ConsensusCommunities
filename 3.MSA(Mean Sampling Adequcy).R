library(psych)
library('GPArotation')

filePath <- ""

fileName <- "" 

data <- as.matrix(read.csv(paste(filePath, fileName, ".csv", sep=""), header = FALSE))
dim(data)

det(data)
eig <- eigen(data)
eig$values

KMO(data)
