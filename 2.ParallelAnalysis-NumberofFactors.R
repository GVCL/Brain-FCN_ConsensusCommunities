rm(list=ls())
library("psych")
library(Matrix) # isSymmetric
library(matrixcalc) # is.positive.definite
library(expm) # sqrtm

filePath <- ""
fileName <- ""  

data <- as.matrix(read.csv(paste(filePath, fileName, ".csv", sep=""), header = FALSE))
dim(data)
print(fileName)
is.symmetric.matrix(round(data,3))
is.positive.semi.definite(round(data,3))
is.positive.definite(round(data,3))
#eigen(data, only.values = TRUE)


########################
library(psych)
library('GPArotation')
library(nFactors)
#########################


FA <- data
ev <- eigen(FA) # get eigenvalues
ap <- parallel(subject=nrow(FA),var=ncol(FA),rep=100,cent=.05, model = "factors")
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS, main =fileName)
