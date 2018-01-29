#install the following packages only once.
install.packages("ggplot2")
install.packages("plotly")
install.packages("Cluster")
install.packages("fpc")

library(cluster) # for k means
library(fpc) # for k means
library(ggplot2)
library(plotly) # for Plotly

head(iris)

#check the correlation between the variables
cor(iris[,c(1)],iris[,c(3)])
cor(iris[,c(2)],iris[,c(3)])
cor(iris[,c(4)],iris[,c(3)])
cor(iris[,c(1)],iris[,c(2)])

pcaMyData <- princomp(iris[,c(1,3)], cor = TRUE)
summary(pcaMyData)
plot(pcaMyData, type = "l")

# Use the elbow method to find out the number of clusters
set.seed(344)
X <- pcaMyData$scores
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(X,i)$withinss)
plot(1:10, wcss, type = "b", main = paste("Clustering Withiness"), 
xlab = "Number of clusters", ylab = "WCSS")

#apply k means Clustering
Kmeans <- kmeans(X,5,iter.max = 500, nstart = 17)


#Method 1 : using clusplots
clusplot(X, Kmeans$cluster, lines = 0, shade = TRUE, color = TRUE,labels = 3,
        plotchar = FALSE, span = TRUE, 
        main = paste("Cluster showing Cost vs Variance"), 
        xlab = "Value of the Cost", ylab = "Value of the variance" )

# Method 2 - plot the cluster using plotly, instead of clusplot.
FinalDF <- data.frame(pcaMyData$scores, factor(Kmeans$cluster))
FinalDF <- transform(FinalDF, cluster_name = paste("Cluster",Kmeans$cluster))
FinalDF$Species <- iris$Species

p <- plot_ly(FinalDF, x = FinalDF$Comp.1 , y = FinalDF$Comp.2, 
     text = FinalDF$Species,mode = "markers", color = FinalDF$cluster_name, 
             marker = list(size = 11)) 

p <- layout(p, title = "PCA Clusters from K-Means Clustering", 
            xaxis = list(title = "Axis Title X"),
            yaxis = list(title = "Axis Title Y"))

# the final plot - display p
p
