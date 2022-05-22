library('igraph')
nodes <- 90

FilePath <- ""
list <- (read.csv(paste(FilePath, "AAL-FA(varimax)-Factors5,6,7,8,9120,11,12_Cliques.csv", sep =""), sep=",", header = TRUE))

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

S = NULL
 
for  (j in 1:nodes)
{ 
 print(j)
  if(!is.element(j, x[,1]))
  { 
    Snew <- cbind(j, 0)
    S <- rbind(S, Snew) 
  }
}  

colnames(S) <- c("Nodes","Cliques")
names(x) <- c("Nodes","Cliques")

cliques <-  rbind(x, S)

write.table(cliques[order(Nodes),], paste(FilePath, "AAL-Factors5to12_Cliques.csv", sep =""), sep=",", col.names= c("Nodes","Cliques"), row.names = FALSE)

