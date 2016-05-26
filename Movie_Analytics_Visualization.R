#install.packages("ggplot2")
library(ggplot2)

plot_analytics <- function(df,Title)
{
  g <- ggplot(df, aes(x=factor(df$AgeRange),y=df$Average)) + geom_bar(width=0.5,stat="identity",position="dodge",aes(fill=factor(df$Gender))) + scale_fill_discrete(name="Gender") 
  g <- g + coord_flip(ylim = c(2.5,5))
  g <- g + xlab("Age/Gender") + ylab("Ratings") + ggtitle(Title) 
}

df <- movie_analytics(1240)
g <- plot_analytics(df,"Terminator")
g

df <- movie_analytics(1)
g <- plot_analytics(df,"Toy Story")
g

df <- movie_analytics(47)
g <- plot_analytics(df,"Seven")
g

df <- movie_analytics(261)
g <- plot_analytics(df,"Little Women")
g


df <- movie_analytics(296)
g <- plot_analytics(df,"Pulp Fiction")
g
