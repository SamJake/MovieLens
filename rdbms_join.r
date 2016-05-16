install.packages("sqldf")
library(sqldf)

users_updated <- sqldf("select UserID,Gender,AgeRange,Occupation,ZipCode from users join age using(Age)")

users_updated <- sqldf("select UserID,Gender,AgeRange,Job,ZipCode from users_updated join job using(Occupation)")