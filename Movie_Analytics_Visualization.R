install.packages("ggplot2")
library(ggplot2)


df <- movie_analytics(1240)
g <- ggplot(df,aes(x=factor(df$AgeRange),y=df$Average)) + geom_bar(position="dodge",stat="identity",aes(fill=factor(df$AgeRange)))