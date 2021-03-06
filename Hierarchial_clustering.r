write.csv(mov3,"E:/R/MovieLens/Data-1M/Generated/movies_genre.csv")
#all fields
names(mov3)
#genres
genre_names <- names(mov3)[5:22]


sum(mov3$Animation)
sum(mov3$Children)
sum(mov3$Animation&mov3$Children)

sum(mov3$Thriller)
sum(mov3$Horror)
sum(mov3$Thriller&mov3$Horror)
sum(mov3$Comedy&mov3$Drama)

#possible ordered pairs -> n(n-1)/2 = 153

a[1] <-sum(mov3$Action)
a[2] <-sum(mov3$Adventure)
a[3] <-sum(mov3$Animation)
a[4] <-sum(mov3$Children)
a[5] <-sum(mov3$Comedy)
a[6] <-sum(mov3$Crime)
a[7] <-sum(mov3$Documentary)
a[8] <-sum(mov3$Drama)
a[9] <-sum(mov3$Fantasy)
a[10] <-sum(mov3$FilmNoir)
a[11] <-sum(mov3$Horror)
a[12] <-sum(mov3$Musical)
a[13] <-sum(mov3$Mystery)
a[14] <-sum(mov3$Romance)
a[15] <-sum(mov3$SciFi)
a[16] <-sum(mov3$Thriller)
a[17] <-sum(mov3$War)
a[18] <-sum(mov3$Western)


for(i in 1:18)
{
  print(paste(genre_names[i]," ",a[i]))
}

distances <- dist(mov3[5:22],method="euclidean")

cluster1 <- hclust(distances,method="ward.D")
cluster2 <- hclust(distances,method="ward.D2")
cluster3 <- hclust(distances,method="complete")
cluster4 <- hclust(distances,method="single")


plot(cluster1)
plot(cluster2)
plot(cluster3)
plot(cluster4)


cluster1_group <- cutree(cluster1, k = 12)
subset(mov3[,1:5],Title=="Batman")

batman_group <- cluster1_group[589]
bat_cluster <- subset(mov3,cluster1_group==batman_group)
bat_cluster$Title[1:25]
bat_rows <- bat_cluster[grep("Batman",bat_cluster$Title),]



colMeans(subset(mov3[5:22],cluster1_group == 1))
         
         
movie_splitup <- split(mov3[5:22],cluster1_group)    
sapply(movie_splitup,colMeans)


group12 <- 12
cluster_12 <- subset(mov3,cluster1_group==group12)
nrow(cluster_12)
cluster_12$Title[1:25]
cluster_12[1:25,1:3]


group10 <- 10
cluster_10 <- subset(mov3,cluster1_group==group10)
nrow(cluster_10)
cluster_10$Title
cluster_10[1:25,1:3]






users2 <- users_updated
udistances <- dist(users2[2:5],method="euclidean")
uclust1 <- hclust(udistances,method = "ward.D")


users2

