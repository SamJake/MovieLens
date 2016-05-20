install.packages("sqldf")
library(sqldf)


thriller <- sqldf("select movieId,Title from mov2 where Thriller = 1")
top_thrill <- sqldf("select Title, avg(Rating) from ratings join thriller using(movieId) group by MovieId order by avg(Rating)")