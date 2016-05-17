mov <- movies
mov$Title <- as.character(mov$Title)
mov$Genres <- as.character(mov$Genres)
for(i in 1:nrow(mov))
{
  temp <- mov[i,]$Title
  mov$year[i] <- substr(temp,nchar(temp)-4,nchar(temp)-1)
  mov$Title[i] <- substr(temp,1,nchar(temp)-7)
}