##### Creating fNet #################
library(matlib)
library("psych")
library(Matrix) # isSymmetric
library(matrixcalc) # is.positive.definite
library(expm) # sqrtm


 
#setwd("...") #Provide the r to z transformed correlation matrices directory
temp = list.files(pattern="*.csv")
N <- length(temp)
N

newMatrix <- NULL
matrix <- NULL

for (i in 1:N) 
{
if (i == 1 )
  {
   matrix <- as.matrix(read.csv(temp[i], header = FALSE))
   newMatrix <- matrix
    if(sum(diag(matrix)) != 0)
      {
         print(i)
         print ("TRUE")   
       }
  }
  else
  {
   matrix <- as.matrix(read.csv(temp[i], header = FALSE))
   newMatrix <- matrix + newMatrix
    if(sum(diag(matrix)) != 0)
    {
     print(i)
     print ("TRUE")
    }   
  }
}



final_fNet <-  as.matrix(newMatrix/N)
range(final_fNet)
final_fNet [1:5,1:5]
diag(final_fNet) <- 1

Matrix <- round(final_fNet,3)
is.symmetric.matrix(round(final_fNet,3)) 
is.positive.semi.definite(round(final_fNet,3)) 
is.positive.definite(round(final_fNet,3)) 

write.table(Matrix, "/aggregated_corrMat.csv", sep = ",", col.names= FALSE, row.names = FALSE)
