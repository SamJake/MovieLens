install.packages("ggplot2")
library(ggplot2)

plot(1:10,head(top_thrill$`avg(Rating)`,10),cex=1.2,pch=16,col="red")
plot(1:10,tail(top_thrill$`avg(Rating)`,10),cex=1.2,pch=16,col="green")