#please make sure files are downlaoded at proper directly
setwd('C:\\Users\\fores\\Documents\\MEGA\\University of Maryland\\SURV 622\\Ass 3')
mdTweets<-readRDS("mdTweets3.rds")
michTweets<-readRDS("michTweets3.rds")
sentiments_mich<-readRDS("sentiments_mich.rds")
sentiments_md<-readRDS("sentiments_md.rds")

#neccessary packages
library(quanteda)
library(SentimentAnalysis)
library(GGally)
library(ggplot2)

#I want to get a sample of 600 from maryland, michigan, make sure to sample properly unlike example code
ratio <- nrow(michTweets)/nrow(mdTweets)
ind_mdsample <- round(200/ratio)
ind_michsample <- 200-ind_mdsample
mdsample <- 3*ind_mdsample
michsample <- 3*ind_michsample

michTweets$SentimentHE <- sentiments_mich$SentimentHE
mdTweets$SentimentHE <- sentiments_md$SentimentHE
  
keepvars <- c("text","SentimentHE")
michTweets <- michTweets[keepvars]
mdTweets <- mdTweets[keepvars]

set.seed(538)

rand.tweets_mich <- michTweets[sample(1:nrow(michTweets), michsample, replace=FALSE),]

rand.tweets_mich_forest <- rand.tweets_mich[1:ind_michsample,]
rand.tweets_mich_michael <- rand.tweets_mich[(ind_michsample+1):(2*ind_michsample),]
rand.tweets_mich_jehun <- rand.tweets_mich[(2*ind_michsample+1):nrow(rand.tweets_mich),]

rand.tweets_md <- mdTweets[sample(1:nrow(mdTweets), mdsample, replace=FALSE),]

rand.tweets_md_forest <- rand.tweets_md[1:ind_mdsample,]
rand.tweets_md_michael <- rand.tweets_md[(ind_mdsample+1):(2*ind_mdsample),]
rand.tweets_md_jehun <- rand.tweets_md[(2*ind_mdsample+1):nrow(rand.tweets_md),]

rand.tweets_forest<-rbind(rand.tweets_mich_forest,rand.tweets_md_forest)
rand.tweets_michael<-rbind(rand.tweets_mich_michael,rand.tweets_md_michael)
rand.tweets_jehun<-rbind(rand.tweets_mich_jehun,rand.tweets_md_jehun)


#only do your name!
rand.tweets_forest$handSent = NA
for(i in 1:nrow(rand.tweets_forest)){
  print(as.character(rand.tweets_forest$text[i]))
  tweetHandSent = readline('Sentiment: ')
  rand.tweets_forest$handSent[i] = tweetHandSent
}

saveRDS(rand.tweets_forest,"rand.tweets_forest.rds")

rand.tweets_michael$handSent = NA
for(i in 1:nrow(rand.tweets_michael)){
  print(as.character(rand.tweets_michael$text[i]))
  tweetHandSent = readline('Sentiment: ')
  rand.tweets_michael$handSent[i] = tweetHandSent
}
saveRDS(rand.tweets_michael,"rand.tweets_michael.rds")

rand.tweets_jehun$handSent = NA
for(i in 1:nrow(rand.tweets_jehun)){
  print(as.character(rand.tweets_jehun$text[i]))
  tweetHandSent = readline('Sentiment: ')
  rand.tweets_jehun$handSent[i] = tweetHandSent
}
saveRDS(rand.tweets_jehun,"rand.tweets_jehun.rds")

rand.tweets_forest<-readRDS("rand.tweets_forest.rds")
rand.tweets_michael<-readRDS("rand.tweets_michael.rds")
rand.tweets_jehun<-readRDS("rand.tweets_jehun.rds")


#putting everything together
masterfile <- rbind(rand.tweets_forest,rand.tweets_michael,rand.tweets_jehun)
masterfile$handSent<-ifelse(masterfile$handSent=='saveRDS(rand.tweets_forest,"rand.tweets_forest.rds")',1,masterfile$handSent)
masterfile$HE_transformed <- ifelse(masterfile$SentimentHE>0,1,ifelse(masterfile$SentimentHE<0,-1,0))




write.table(masterfile, "masterfile.txt", sep="\t")