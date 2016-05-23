install.packages("sqldf")
library(sqldf)


#thriller <- sqldf("select movieId,Title from mov2 where Thriller = 1")
#top_thrill <- sqldf("select Title, avg(Rating) from ratings join thriller using(movieId) group by MovieId order by avg(Rating)")



category <- "Romance"
sql <- sprintf("select movieId, Title from mov2 where %s = 1",category)

movies_by_category <- sqldf(sql)
top10_movies_by_category <- sqldf("select Title, avg(Rating) from ratings join movies_by_category using(movieId) group by MovieId order by avg(Rating) desc limit 10")
worst10_movies_by_category <- sqldf("select Title, avg(Rating) from ratings join movies_by_category using(movieId) group by MovieId order by avg(Rating) limit 10")