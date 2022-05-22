CorrMatrix <- read.csv("../Data/Weighted_edge_AALDiag1.csv", header = FALSE)
Communiites <- read.csv("/AAL90-AverageofCoANs-FA,5,6,7,8,9,10,11.csv", header = TRUE)
n <- max(unique(Communiites$Communities))
for (i in 1:n)
{
	Communiites <- Communiites[order(Communiites$Nodes),]
	sortedCommunities1 <- Communiites[which(Communiites$Communities == i),]
	rowSort <- CorrMatrix[sortedCommunities1$Nodes, ]
	colSort <- rowSort[ ,sortedCommunities1$Nodes]
	FinalMat <- as.matrix(colSort)
	print(dim(FinalMat))	
	write.table(FinalMat, sep = "\t", col.names=FALSE, row.names=FALSE)

}

