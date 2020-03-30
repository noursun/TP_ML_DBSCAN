# chargement des données ---------------------

data_original <- read.table(file.choose(), header = TRUE, sep = ",")
data_original = data_original[,-1]
dim(data_original)
summary(data_original)

data = data_original[,-10]
dim(data)

# featrures selection -----------------------------------

library(caret)

set.seed(100)
dbscanMod <- train(Class~., data=data_original, method="rpart")
dbscanImp <- varImp(dbscanMod)
print(dbscanImp)

# DBSCAN  avec 3 attributs --------------------------------

library(dbscan)
data = data[,-1]
data = data[,-8]
data = data[,-7]
data = data[,-4]
data = data[,-4]
data = data[,1:3]

dim(data)

# avec k = dim(data) + 1 -----------------------

kNNdistplot(data, k = 4)
c1 = dbscan(data,1,4)
c1

clusplot(data,c1$cluster,color= TRUE, labels = 3)
hullplot(data, c1)

# avec k = log(N) -----------------------

kNNdistplot(data, k = log(683))
c11 = dbscan(data,3,log(683))
c11

clusplot(data,c11$cluster,color= TRUE, labels = 3)
hullplot(data, c11)
