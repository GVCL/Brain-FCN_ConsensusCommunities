library('igraph')
require(gtools)

#################################################################################################

FilePath <- ""
FileName <- "Factor_Communities_AAL90-EFA-5"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
head(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA5 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA5[cs[1],cs[2]] <- 1
   }
}

#################################################################################################
FilePath <- "D:/Research/Prof. Olaf Sporns/Data-Shaefer Parcellation/nki_Latest(July2020)/Results/Factors/"
FileName <- "Factor_Communities_AAL90-EFA-6"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
head(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA6 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA6[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

FilePath <- "D:/Research/Prof. Olaf Sporns/Data-Shaefer Parcellation/nki_Latest(July2020)/Results/Factors/"
FileName <- "Factor_Communities_AAL90-EFA-7"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
head(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA7 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA7[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

FileName <- "Factor_Communities_AAL90-EFA-8"

list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
dim(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA8 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA8[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

FileName <- "Factor_Communities_AAL90-EFA-9"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
dim(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA9 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA9[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

FileName <- "Factor_Communities_AAL90-EFA-10"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
dim(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA10 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA10[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

FileName <- "Factor_Communities_AAL90-EFA-11"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
dim(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA11 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA11[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

FileName <- "Factor_Communities_AAL90-EFA-12"
list <- (read.csv(paste(FilePath, FileName, ".csv", sep =""), sep=",", header = TRUE))
dim(list)
commuDistinct <- unique(list$Factors)
n <- length(commuDistinct)
print (n)
methodFA12 <- matrix( rep( 0, len=90*90), nrow = 90)

for (i in 1:n)
{ 
   check <- paste("ML",i, sep="")
   Nodes <- list$Nodes[list$Factors  == check]
   permuts <- permutations(n = length(Nodes), r = 2, v = Nodes)
   for (j in 1:nrow(permuts))
   {
    cs <- permuts[j,]
    methodFA12[cs[1],cs[2]] <- 1
   }
}

#################################################################################################

commonMat <- methodFA5 & methodFA6 & methodFA7 & methodFA8 & methodFA9 & methodFA10 & methodFA11 & methodFA12 

commonMat <- commonMat*1

commonMat <- as.matrix(commonMat)

g  <- graph.adjacency(commonMat,weighted=TRUE,mode="lower", diag=FALSE)
df <- get.data.frame(g)
head(df)

# Louvain
library('igraph')
list <- df
dim(list)
xlist <- graph.data.frame(list, directed = FALSE)
plot(xlist)
groups <- cluster_louvain(xlist)
n <- length(groups)
n
x <- NULL
for (i in 1:n)
{
print(i)
  xnew <- data.frame(groups[[i]],i, fix.empty.names = FALSE)
  x <- rbind(x, xnew)
}
write.table(x, "AAL-FA5to12.csv", sep=",", col.names= c("Nodes","Communities"), row.names = FALSE)

### Likelihood matrix ####
library('igraph')

N <- 8
FileName <- "5,6,7,8,9,10,11,12"
commonMat1 <- (methodFA5 + methodFA6 + methodFA7 + methodFA8 + methodFA9 +  methodFA10 +  methodFA11 + methodFA12)/N


g  <- graph.adjacency(commonMat1,weighted=TRUE,mode="lower", diag=FALSE)
df <- get.data.frame(g)
head(df)
write.table(df, "AAL90-AverageofCoANs-FA5to12-Edges.csv", sep=",", col.names= c("Source","Target","CoONs-Averaged-EdgeWeight"), row.names = FALSE)

list <- df
dim(list)
xlist <- graph.data.frame(list, directed = FALSE)
plot(xlist)
groups <- cluster_louvain(xlist)
n <- length(groups)
n
x <- NULL
for (i in 1:n)
{
  xnew <- data.frame(groups[[i]],i, fix.empty.names = FALSE)
  x <- rbind(x, xnew)
}
write.table(x, paste("AAL90-AverageofCoANs-",FileName,".csv", sep=""), sep=",", col.names= c("Nodes","Communities"), row.names = FALSE)
write.table(commonMat1, paste("AAL90-AverageofCoANs-",FileName,"-Matrix.csv", sep=""), sep=",", col.names= FALSE, row.names = FALSE)



