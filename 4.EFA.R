########################
library(psych)
library('GPArotation')
#########################
rm(list=ls())
##### To get factors #######
n = 5
FA <- read.csv("../Data/Weighted_edge_AALDiag1.csv", header = FALSE)
dim(FA)
M <- dim(FA)[1] 
f3 <- fa(FA,n,n.obs = M,fm="ml")   # http://127.0.0.1:26324/library/psych/html/fa.html

sprintf("RMSA Value is : %f ", f3$rms)
sprintf("RMSEA Value is : %f", f3$RMSEA[1])
sprintf("Tucker Lewis Index (TLI) of factoring reliability  is : %f", f3$TLI)

# To Print Factor Loadings
source("printLoadings.R")
cutoff <- printLoadings(f3$loadings,2,0.0, FALSE)
toWrite <- as.table(cutoff)
colNames <- colnames(cutoff)
#FilePathToWrite <- "C:/Users/User/Desktop/Research/CNA/ComplexNetwroks-Results/3. FactorAnalysis/FactorAnalysis- Results/FactorLoadings/"
write.table(toWrite, "Factor_Communities_5(varimax).csv", sep = ",", col.names = colNames, row.names = c(1:90))

# To select Final Factor
fa.results <- f3
source("fa1drawing.R")
draw(fa.results, cut = 0.2) # this will take care of writing files at working directory(getwd)
fa.diagram(f3,cut=.2,digits=2)  

