#imported data set, _full is everything no append is 20,000 sample - mike uses 2 as append
setwd('C:\\Users\\fores\\Documents\\MEGA\\University of Maryland\\SURV 622\\Ass 3')
bballtweets<-readRDS("bballtweets_full.rds")
bothTweets<-readRDS("bothTweets_full.rds")
irrelevantTweets<-readRDS("irrelevantTweets_full.rds")
mdTweets<-readRDS("mdTweets_full.rds")
michTweets<-readRDS("michTweets_full.rds")

#neccessary packages
library(quanteda)
library(SentimentAnalysis)
library(GGally)
library(ggplot2)

#number 2 part 1
data('DictionaryGI')
options(max.print=3000)
DictionaryGI$positive
DictionaryGI$negative

data('DictionaryHE')
options(max.print=3000)
DictionaryHE$positive
DictionaryHE$negative

#number 2 part 2
sentiments_mich = analyzeSentiment(as.character(michTweets$text))
head(sentiments_mich)

sentiments_md = analyzeSentiment(as.character(mdTweets$text))
head(sentiments_md)

#number 2 part 3
ggpairs(data.frame(sentiments_mich$SentimentGI, sentiments_mich$SentimentHE))

ggpairs(data.frame(sentiments_md$SentimentGI, sentiments_md$SentimentHE))

#number 2 part 4
ggplot(data=data.frame(time=as.Date(michTweets$created_at), sentiment=sentiments_mich$SentimentHE), aes(x=time, y=sentiment)) + 
  geom_point()

ggplot(data=data.frame(time=as.Date(mdTweets$created_at), sentiment=sentiments_md$SentimentHE), aes(x=time, y=sentiment)) + 
  geom_point()


ggplot(data=data.frame(time=as.Date(michTweets$created), sentiment=sentiments_mich$SentimentHE), aes(x=jitter(as.numeric(time)), y=sentiment)) + 
  geom_point()  + geom_smooth()

ggplot(data=data.frame(time=as.Date(mdTweets$created), sentiment=sentiments_md$SentimentHE), aes(x=jitter(as.numeric(time)), y=sentiment)) + 
  geom_point()  + geom_smooth()


#number 2 part 2
michTweets$HEsent = ifelse(sentiments_mich$SentimentHE==0, 'neutral', 
                           ifelse(sentiments$SentimentHE>0, 'positive', 'negative'))
ggplot(michTweets, aes(as.Date(created_at), fill=HEsent)) + geom_histogram()
ggplot(michTweets, aes(as.Date(created_at), fill=HEsent)) + geom_histogram(position='fill')

mdTweets$HEsent = ifelse(sentiments_md$SentimentHE==0, 'neutral', 
                         ifelse(sentiments$SentimentHE>0, 'positive', 'negative'))
ggplot(mdTweets, aes(as.Date(created_at), fill=HEsent)) + geom_histogram()
ggplot(mdTweets, aes(as.Date(created_at), fill=HEsent)) + geom_histogram(position='fill')


#number 2 part 5
par(mfrow=c(1,2))
hist(sentiments_mich$SentimentHE[michTweets$is_retweet==TRUE], main='Sentiment of Retweets', xlab='Sentiment')
hist(sentiments_mich$SentimentHE[michTweets$is_retweet==FALSE], main='Sentiment of Original Tweets', xlab='Sentiment')
par(mfrow=c(1,1))

mean(sentiments_mich$SentimentHE[michTweets$is_retweet==TRUE])
mean(sentiments_mich$SentimentHE[michTweets$is_retweet==FALSE])


par(mfrow=c(1,2))
hist(sentiments_md$SentimentHE[michTweets$is_retweet==TRUE], main='Sentiment of Retweets', xlab='Sentiment')
hist(sentiments_md$SentimentHE[michTweets$is_retweet==FALSE], main='Sentiment of Original Tweets', xlab='Sentiment')
par(mfrow=c(1,1))

mean(sentiments_md$SentimentHE[mdTweets$is_retweet==TRUE])
mean(sentiments_md$SentimentHE[mdTweets$is_retweet==FALSE])

saveRDS(sentiments_mich,"sentiments_mich.rds")
saveRDS(sentiments_md,"sentiments_md.rds")

masterfile$is_good <- ifelse(masterfile$HE_transformed==masterfile$handSent,'yes','no')
match<-length(which(masterfile$is_good == "yes"))
no_match<-length(which(masterfile$is_good == "no"))
score1<-match/(no_match+match)

masterfile$is_good <- ifelse((masterfile$HE_transformed==1 & masterfile$handSent==1) | (masterfile$HE_transformed==-1 & masterfile$handSent==-1),'match',ifelse((masterfile$HE_transformed==1 & masterfile$handSent==-1) | (masterfile$HE_transformed==-1 & masterfile$handSent==1),'no_match',NA))
match<-length(which(masterfile$is_good == "match"))
no_match<-length(which(masterfile$is_good == "no_match"))
score2<-match/(no_match+match)
