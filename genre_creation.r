mov2 <- mov
for(i in 1:nrow(mov2))
{
  temp <- mov2[i,]$Genres
  mov2$Action[i] <- grepl("Action",temp)
  mov2$Adventure[i] <- grepl("Adventure",temp)
  mov2$Animation[i] <- grepl("Animation",temp)
  mov2$Children[i] <- grepl("Children's",temp)
  mov2$Comedy[i] <- grepl("Comedy",temp)
  mov2$Crime[i] <- grepl("Crime",temp)
  mov2$Documentary[i] <- grepl("Documentary",temp)
  mov2$Drama[i] <- grepl("Drama",temp)
  mov2$Fantasy[i] <- grepl("Fantasy",temp)
  mov2$FilmNoir[i] <- grepl("Film-Noir",temp)
  mov2$Horror[i] <- grepl("Horror",temp)
  mov2$Musical[i] <- grepl("Musical",temp)
  mov2$Mystery[i] <- grepl("Mystery",temp)
  mov2$Romance[i] <- grepl("Romance",temp)
  mov2$SciFi[i] <- grepl("Sci-Fi",temp)
  mov2$Thriller[i] <- grepl("Thriller",temp)
  mov2$War[i] <- grepl("War",temp)
  mov2$Western[i] <- grepl("Western",temp)
} 