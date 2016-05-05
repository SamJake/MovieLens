read_file <- function(file_path)
{
	sample <- read.csv(file = file_path, nrows = 100)
	classes <- sapply(sample,class)
	data <- read.csv(file = file_path, colClasses = classes)
}


links <- read_file("C:/Soft/R/Data/ml-latest/links.csv")
movies <- read_file("C:/Soft/R/Data/ml-latest/movies.csv")
ratings <- read_file("C:/Soft/R/Data/ml-latest/ratings.csv")
tags <- read_file("C:/Soft/R/Data/ml-latest/tags.csv")



ratings$timestamp <- as.POSIXct(ratings$timestamp,origin = "1970-01-01")
tags$timestamp <- as.POSIXct(tags$timestamp,origin = "1970-01-01")