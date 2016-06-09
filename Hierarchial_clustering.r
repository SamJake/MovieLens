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