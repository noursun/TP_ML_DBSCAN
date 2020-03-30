# chargement des données ---------------------

data_original <- read.table(file.choose(), header = TRUE, sep = ",")
data_original = data_original[,-1]
dim(data_original)
summary(data_original)

data = data_original[,-10]

# DBSCAN  avec 9 attributs --------------------------------
library(cluster)
library(dbscan)

# avec k = dim(data) + 1 -----------------------

kNNdistplot(data, k = 10)
c1 = dbscan(data,4,10)
c1

clusplot(data,c1$cluster,color= TRUE, labels = 3)
hullplot(data, c1)

# avec k = log(N) -----------------------

kNNdistplot(data, k = log(683))
c11 = dbscan(data,3,log(683))
c11

clusplot(data,c11$cluster,color= TRUE, labels = 3)
hullplot(data, c11)
