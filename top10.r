install.packages("sqldf")
library(sqldf)

top10 <- function(category)
{
  sql <- sprintf("select movieId, Title from mov2 where %s = 1",category)
  movies_by_category <- sqldf(sql)  
  top10_movies_by_category <- sqldf("select Title, avg(Rating) as Rating from ratings join movies_by_category using(movieId) group by MovieId order by avg(Rating) desc limit 10")
}


worst10 <- function(category)
{
  sql <- sprintf("select movieId, Title from mov2 where %s = 1",category)
  movies_by_category <- sqldf(sql)  
  worst10_movies_by_category <- sqldf("select Title, avg(Rating) as Rating from ratings join movies_by_category using(movieId) group by MovieId order by avg(Rating) limit 10")
}

category <- "Action"
top10(category)
worst10(category)

top10_by_age <- function(category)
{
  sql <- sprintf("select UserID from users_updated where AgeRange = '%s'",category)
  users_by_age <- sqldf(sql)  
  top10_movies_by_age <- sqldf("select movieID, avg(Rating) as Rating from ratings join users_by_age using(UserId) group by MovieId order by avg(Rating) desc limit 10")
  top10_movies_by_age <- sqldf("select Title, Rating from top10_movies_by_age join mov2 using(MovieId)")
}


worst10_by_age <- function(category)
{
  sql <- sprintf("select UserID from users_updated where AgeRange = '%s'",category)
  users_by_age <- sqldf(sql)  
  top10_movies_by_age <- sqldf("select movieID, avg(Rating) as Rating from ratings join users_by_age using(UserId) group by MovieId order by avg(Rating) limit 10")
  top10_movies_by_age <- sqldf("select Title, Rating from top10_movies_by_age join mov2 using(MovieId)")
}


category <- "Under 18"
top10_by_age(category)
worst10_by_age(category)