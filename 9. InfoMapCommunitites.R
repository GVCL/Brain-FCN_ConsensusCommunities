
rm(list=ls())
library('igraph')

filepath <- ""
filetoread <- "aal90nodes_corrmat_edgelist_above(0.5).csv"

filetowrite <- "AAL90(0.5aboveedges).csv"

list <- (read.csv(paste(filepath, filetoread, sep =""), sep=",", header = true))
dim(list)
xlist <- graph.data.frame(list, directed = false)
plot(xlist)
groups <- cluster_infomap(xlist, modularity = true)
modularity <- modularity(groups)
modularity 
n <- length(groups)
n
x <- null
for (i in 1:n)
{
print(i)
  xnew <- data.frame(groups[[i]],i, fix.empty.names = false)
  x <- rbind(x, xnew)
}
write.table(x, paste(filetowrite,sep =""), sep = ",", col.names= c("nodes","communities"), row.names = false)

