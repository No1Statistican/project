setwd('C:\\Users\\fores\\Documents\\MEGA\\University of Maryland\\SURV 622\\Ass 3')
df <- readRDS("all_tweets.rds")

library(qdap)

frequent_terms <- freq_terms(df, 100, stopwords = tm::stopwords("english"))
plot(frequent_terms)

rm(df)

library(quanteda)
library(SentimentAnalysis)
library(GGally)
library(ggplot2)


irrelevantWords <- c('football', 'womens','trump')
MichiganWords <- c('goblue', 'michigan','umichbball','ann arbor','beilein','umichathletics','umich')
MarylandWords <- c('maryland', 'terrapin','terps','umd','turgeon', 'college park')

michTweets <- data.frame()
mdTweets <- data.frame()
irrelevantTweets <- data.frame()
bothTweets <- data.frame()


bballtweets <- readRDS("all_tweets.rds")
bballtweets <- as.data.frame(bballtweets)
bballtweets$text <- iconv(bballtweets$text, "UTF-8", "ASCII", "")
n.sample <- 285586
bballtweets <- bballtweets[sample(1:nrow(bballtweets), n.sample, replace=FALSE),]

for(i in 1:n.sample){
  # break up tweet into indiviaul words
  tweet = bballtweets$text[i]
  tweet = tolower(tweet)
  words = tokens(tweet)
  # if it contains an irrelevant word, put it in the irrelevant data frame
  if(length(intersect(words$text1, irrelevantWords))>0){
    irrelevantTweets = rbind(irrelevantTweets, bballtweets[i,])
  }
  else{
    numMIwords = length(intersect(words$text1, MichiganWords))
    numMDwords = length(intersect(words$text1, MarylandWords))
    # if it contains only MI words, put it in the MI data frame
    if(numMIwords>0 & numMDwords==0){
      michTweets = rbind(michTweets, bballtweets[i,])
    }
    # if it contains only MD words, put it in the MD data frame
    else if(numMIwords==0 & numMDwords>0){
      mdTweets = rbind(mdTweets, bballtweets[i,])
    }
    # data frame of tweets that contain both MI and MD words
    else if(numMIwords>0 & numMDwords>0){
      bothTweets = rbind(bothTweets, bballtweets[i,])
    }
  }
}

#imported data set, _full is everything no append is 20,000 sample - mike uses 2 as append
setwd('C:\\Users\\fores\\Documents\\MEGA\\University of Maryland\\SURV 622\\Ass 3')
bballtweets<-readRDS("bballtweets.rds")
bothTweets<-readRDS("bothTweets.rds")
irrelevantTweets<-readRDS("irrelevantTweets.rds")
mdTweets<-readRDS("mdTweets.rds")
michTweets<-readRDS("michTweets.rds")

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
ggpairs(data.frame(sentiments_mich$SentimentGI, sentiments_mich$SentimentGI))

ggpairs(data.frame(sentiments_umd$SentimentGI, sentiments_md$SentimentHE))

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

#fix this
mdTweets$GIsent = ifelse(sentiments_md$SentimentHE==0, 'neutral', 
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

#fix
mean(sentiments_md$SentimentHE[michTweets$is_retweet==TRUE])
mean(sentiments_md$SentimentHE[michTweets$is_retweet==FALSE])

