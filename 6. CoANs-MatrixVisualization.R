library(reshape2)
library(ggcorrplot)
library(seriation)
##############################   AAL - 90   #######################################################################################
###FA-Varimax
CorrMatrix <- read.csv("/Data/Weighted_edge_AALDiag1.csv", header = FALSE)
Communiites <- read.csv("/AAL90-AverageofCoANs-FA,5,6,7,8,7,10,11.csv", header = TRUE)


Communiites <- Communiites[order(Communiites$Nodes),]
sortedCommunities1 <- Communiites[which(Communiites$Communities == 1),]
rowSort <- CorrMatrix[sortedCommunities1$Nodes, ]
colSort <- rowSort[ ,sortedCommunities1$Nodes]
FinalMat <- as.matrix(colSort)
dim(FinalMat)

order <- seriate(FinalMat, method = "PCA", control = NULL, margin = c(1,2))
cc <- pimage(FinalMat, order, main = "PCA")
reordered1 <- get_order(order)
length(reordered1)
reordered1
length(sortedCommunities1$Nodes)
neworder1 <- sortedCommunities1$Nodes
new1 <- neworder1[reordered1]


sortedCommunities2 <- Communiites[which(Communiites$Communities ==2),]
rowSort <- CorrMatrix[sortedCommunities2$Nodes, ]
colSort <- rowSort[ ,sortedCommunities2$Nodes]
FinalMat <- as.matrix(colSort)
dim(FinalMat)
order <- seriate(FinalMat, method = "PCA", control = NULL, margin = c(1,2))
pimage(FinalMat, order, main = "PCA")
reordered2 <- get_order(order)
reordered2
neworder2 <- sortedCommunities2$Nodes
new2 <- neworder2[reordered2]


sortedCommunities3 <- Communiites[which(Communiites$Communities ==3),]
rowSort <- CorrMatrix[sortedCommunities3$Nodes, ]
colSort <- rowSort[ ,sortedCommunities3$Nodes]
FinalMat <- as.matrix(colSort)
dim(FinalMat)
order <- seriate(FinalMat, method = "PCA", control = NULL, margin = c(1,2))
pimage(FinalMat, order, main = "PCA")
reordered3 <- get_order(order)
reordered3
neworder3 <- sortedCommunities3$Nodes
new3 <- neworder3[reordered3]


sortedCommunities4 <- Communiites[which(Communiites$Communities ==4),]
rowSort <- CorrMatrix[sortedCommunities4$Nodes, ]
colSort <- rowSort[ ,sortedCommunities4$Nodes]
FinalMat <- as.matrix(colSort)
dim(FinalMat)
order <- seriate(FinalMat, method = "PCA", control = NULL, margin = c(1,2))
pimage(FinalMat, order, main = "PCA")
reordered4 <- get_order(order)
reordered4
neworder4 <- sortedCommunities4$Nodes
new4 <- neworder4[reordered4]

sortedCommunities5 <- Communiites[which(Communiites$Communities ==5),]
rowSort <- CorrMatrix[sortedCommunities5$Nodes, ]
colSort <- rowSort[ ,sortedCommunities5$Nodes]
FinalMat <- as.matrix(colSort)
dim(FinalMat)
order <- seriate(FinalMat, method = "PCA", control = NULL, margin = c(1,2))
pimage(FinalMat, order, main = "PCA")
reordered5 <- get_order(order)
reordered5
neworder5 <- sortedCommunities5$Nodes
new5 <- neworder5[reordered5]



length(new1)
length(new2)
length(new3)
length(new4)
length(new5)


NodeOrder <- c(new1,new2, new3, new4, new5) 

rowSort <- CorrMatrix[NodeOrder, ]
newOrder <- paste("V",NodeOrder, sep="")
colSort <- rowSort[ ,newOrder]
FinalMat <- as.matrix(colSort)
dim(FinalMat)

sorted_Communities <- Communiites[NodeOrder,]

colnames(FinalMat) <- (sorted_Communities$NodeName)
rownames(FinalMat) <- (sorted_Communities$NodeName)

axiscolors = sorted_Communities$Color
unique(axiscolors)


pdf ("AAL90-ConsensusMatrix[5_11].pdf")
ggcorrplot(FinalMat, )+
scale_fill_gradient2(low = "#377eb8", high = "#e41a1c", mid = "white",  midpoint = 0, limit = c(range(FinalMat)[1],range(FinalMat)[2]), space = "Lab", name="Pearson Correlation") +
theme( axis.text.y = element_text(size = 3, face ="bold", color=axiscolors), axis.text.x = element_text(size = 3, angle = 90, face ="bold", color=axiscolors ), axis.ticks = element_line(), axis.ticks.x = element_line(), axis.ticks.y = element_line())

dev.off()