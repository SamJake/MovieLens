install.packages("ggplot2")
library(ggplot2)

plot_analytics <- function(df,Title)
{
g <- ggplot(df,aes(x=factor(df$AgeRange),y=df$Average)) + geom_bar(position="dodge",width=0.7,stat="identity",aes(fill=factor(df$Gender)))
g <- g + xlab("") + ylab("Ratings") + ggtitle(Title) 
g <- g + coord_cartesian(ylim = c(3,5)) + scale_fill_discrete(name="Gender")
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

df <- movie_analytics(364)
g <- plot_analytics(df,"Pulp Fiction")
g