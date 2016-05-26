#install.packages("sqldf")
library(sqldf)

#id <- 1721 #Titanic
#id <- 1 #ToyStory
id <- 196 #Species

movie_analytics <- function(id)
{
  sql <- sprintf("select UserId, Rating from ratings where movieId = '%s'",id)
  all_users <- sqldf(sql)
  
  all_users_upd <- sqldf("select userid, AgeRange, Gender, Rating from all_users join users_updated using(userid)")
  
  analytics <- sqldf("select AgeRange, Gender, count(Rating) as Count, avg(Rating) as Average from all_users_upd group by AgeRange, Gender order by AgeRange, Gender")
}
