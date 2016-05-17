mov2 <- mov
#for(i in 1:nrow(mov2))
for(i in 1:5)
{
  temp <- mov2[i,]$Genres
  mov2[i]$Action <- grep("Action",temp)
  mov2[i]$Adventure <- grep("Adventure",temp)
  mov2[i]$Animation <- grep("Animation",temp)
  mov2[i]$Children <- grep("Children's",temp)
  mov2[i]$Comedy <- grep("Comedy",temp)
  mov2[i]$Crime <- grep("Crime",temp)
  mov2[i]$Documentary <- grep("Documentary",temp)
  mov2[i]$Drama <- grep("Drama",temp)
  mov2[i]$Fantasy <- grep("Fantasy",temp)
  mov2[i]$FilmNoir <- grep("Film-Noir",temp)
  mov2[i]$Horror <- grep("Horror",temp)
  mov2[i]$Musical <- grep("Musical",temp)
  mov2[i]$Mystery <- grep("Mystery",temp)
  mov2[i]$Romance <- grep("Romance",temp)
  mov2[i]$SciFi <- grep("Sci-Fi",temp)
  mov2[i]$Thriller <- grep("Thriller",temp)
  mov2[i]$War <- grep("War",temp)
  mov2[i]$Western <- grep("Western",temp)
} 