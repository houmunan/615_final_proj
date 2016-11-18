install.packages("streamR")

library(streamR)

load("my_oauth.Rdata")

filterStream("tweets.json", 
             track=c("Obama", "Biden"), 
             timeout=10, oauth=my_oauth)
tweets.df <- parseTweets("tweets.json", simplify=TRUE)

c(length(grep("Obama", tweets.df$text, ignore.case=TRUE)),
  length(grep("biden", tweets.df$text, ignore.case=TRUE)))


###########################################



filterStream("tweetsUS.json",
             locations=c(‐125,25,‐66,50),timeout=300,
             oauth=my_oauth) 

tweets.df <- parseTweets("tweetsUS.json",verbose=FALSE)

library(ggplot2) 
library(grid) 

map.data <- map_data("state") 
points <- data.frame(x=as.numeric(tweets.df$lon),
                       y=as.numeric(tweets.df$lat))


points <- points[points$y>25,] 
ggplot(map.data)+
  geom_map(aes(map_id=region),
           map=map.data,
           fill="white", 
           color="grey20",size=0.25)+
  expand_limits(x=map.data$long,y=map.data$lat)+ 
  theme(axis.line=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank(), 
        axis.title=element_blank(),
        panel.background=element_blank(),
        panel.border=element_blank(), 
        panel.grid.major=element_blank(),
        plot.background=element_blank(), 
        plot.margin=unit(0*c(‐1.5,‐1.5,‐1.5,‐1.5),"lines"))+
        geom_point(data=points, 
        aes(x=x,y=y),size=1,
        alpha=1/5,color="darkblue")




sampleStream("tweetsSample.json", timeout = 120, oauth = my_oauth, verbose = FALSE)

tweets.df <- parseTweets("tweetsSample.json", verbose = FALSE)

mean(as.numeric(tweets.df$friends_count))

table(is.na(tweets.df$lat))

round(sort(table(tweets.df$lang), decreasing = T)[1:5]/sum(table(tweets.df$lang)), 2)

userStream("mytweets.json", timeout = 120, oauth = my_oauth, verbose = FALSE)
tweets.df <- parseTweets("mytweets.json", verbose = FALSE)
round(sort(table(tweets.df$lang), decreasing = T)[1:3]/sum(table(tweets.df$lang)), 2)
















