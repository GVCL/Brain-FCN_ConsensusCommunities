library('igraph')

FilePath <- ""
FileToRead <- "AAL90Nodes_corrMat_EdgeList_Above(0.5).csv"
FileToWrite <- "LouvainCommunities_AAL90(0.5AboveEdges).csv"

list <- (read.csv(paste(FilePath, FileToRead, sep =""), sep=",", header = TRUE))
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
write.table(x, paste(FileToWrite,sep =""), sep = ",", col.names= c("Nodes","Communities"), row.names = FALSE)

