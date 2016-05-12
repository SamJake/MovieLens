read_file2 <- function(file_path)
{
  text <- readLines(file_path)
  text2 <- gsub(pattern = "::", replacement = ",", x=text)
  writeLines(text2,con=file_path)
  data <- read.csv(file = file_path, header=FALSE, sep=",")
}



movies2 <- read_file2("C:/Soft/R/Data/ml-1m/movies.csv")
ratings2 <- read_file2("C:/Soft/R/Data/ml-1m/ratings.csv")
users2 <- read_file2("C:/Soft/R/Data/ml-1m/users.csv")

