library("igraph")

FilePath <- ""
FileName <- "Weighted_edge_AALDiag1.csv.csv"
data <- (read.csv(paste(FilePath, FileName, sep =""), sep=",", header = TRUE))
dim(data)
results = NULL
for(i in seq(0.1,0.9,0.02)) {
 print(i)
 sublist <- data[data$Corr >=i ,]
 newData <- data.matrix(data.frame(sublist$Source,sublist$Target))
 graph <- graph.edgelist(newData,directed=FALSE)

  #if(is_connected (graph)) {  

   comps <- components(graph, mode = c("strong"))
   count <- comps$no # Number of Components at each T
   maxNodes <- max(comps$csize)   # Nodes Count 
   #print(groups(comps))
   new <- cbind(i, count, maxNodes)
   results <- rbind(results, new)
  #}
  
 components <- components(graph, mode = c("strong"))
 count <- components $no # Number of Components at each T
 maxNodes <- max(components$csize)   # Nodes Count 
  
}

#write.table(results, "FindingThreshold-AAL90.csv", sep = ",", col.names= c("cutoff","ConnectedComponentsCount","#Nodes"), row.names = FALSE)


###  Plot of percolation analysis #####
x <- results[,1] #
y1 <- results[,3]
y2 <- results[,2]


par(mar = c(5, 5, 5, 5))
plot(x, y1, type="n", main="Finding Threshold Value", xlab="",ylab="", lty = 1, cex.axis=1, font = 2, font.sub = 2, xaxt="n")
mtext(side=1, line=3, "Cutoff on Edge Values", font=2,cex=1.2)
mtext(side=2, line=2, "#Nodes of Giant Components", font=2, cex=1.2)
axis(1, at = seq(0.1, 0.9, by=0.02), font=2, las=2)
lines(x, y1, pch = 18, col = "black", type = "p", lty = 2, lwd = 1)
lines(x, y1, type="l")
#abline(v=0.52, col="blue", lty=2, lwd=3)
abline(v=0.32, col="blue", lty=2, lwd=3)
par(new = TRUE)
plot(x, y2, type = "n", xaxt = "n", yaxt = "n", ylab = "", xlab = "", col = "black", lty = 1, lwd = 1, cex.axis=4)
mtext(side=4, line=2.5, "#Components", font=2, cex=1.2, col = "grey")
axis(4, at = seq(0, 200, by=15), font=2, las=2, col.axis ="grey")
lines(x, y2, pch = 19, col = "grey", type = "p", lty = 2, lwd = 1)
lines(x, y2, type="l")



