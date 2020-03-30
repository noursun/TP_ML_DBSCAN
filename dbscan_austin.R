# chargement des données ---------------------

data_original <- read.table(file.choose(), header = TRUE, sep = ",")
dim(data_original)
summary(data_original)
data_original[1:10,]
data = na.omit(data_original)
dim(data)

# DBSCAN  avec 9 attributs --------------------------------

library(dbscan)

# avec k = dim(data) + 1 -----------------------

kNNdistplot(data, k = 3)
c1 = dbscan(data,70,3)
c1

clusplot(data,c1$cluster,color= TRUE, labels = 74)
hullplot(data, c1)

# avec k = log(N) -----------------------

kNNdistplot(data, k = log(5000))
c11 = dbscan(data,100,log(5000))
c11

clusplot(data,c11$cluster,color= TRUE, labels = 3)
hullplot(data, c11)
