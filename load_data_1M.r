read_file2 <- function(file_path)
{
  text <- readLines(file_path)
  text2 <- gsub(pattern = "::", replacement = ",", x=text)
  writeLines(text2,con=file_path)
  data <- read.csv(file = file_path, header=FALSE, sep=",")
}



movies <- read_file2("C:/Soft/R/Data/ml-1m/movies.csv")
ratings <- read_file2("C:/Soft/R/Data/ml-1m/ratings.csv")
users <- read_file2("C:/Soft/R/Data/ml-1m/users.csv")
age <- read.csv("C:/Soft/R/Data/ml-1m/age.csv", header = FALSE)
job <- read.csv("C:/Soft/R/Data/ml-1m/job.csv", header = FALSE)

names(movies) <- c("MovieID","Title","Genres")
names(ratings) <- c("UserID","MovieID","Rating","Timestamp")
names(users) <- c("UserID","Gender","Age","Occupation","ZipCode")
names(age) <- c("Age","AgeRange")
names(job) <- c("Occupation","Job")

ratings$Timestamp <- as.POSIXct(ratings$Timestamp,origin = "1970-01-01")