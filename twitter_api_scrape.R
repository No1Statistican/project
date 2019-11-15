library(rtweet)
library(tidyverse)
library(tidytext)
library(ggmap)
library(dplyr)
library(tm)
library(tidytext)

create_token(
  app = "Twitter API String Tracker",
  consumer_key = "rCVjASAtmlConQfTd1R6XjOTx",
  consumer_secret = "ysYiFKXE2rdE2LOH2dp7Ow1tiiciNBR1Bz5uXMPKJghd1cLbkE",
  access_token = "843482256803020809-K20s6YXiVp6DEohoK0AUo11n3mLlPXI",
  access_secret = "zWaW1TE4OcUL8TcLqGNQxyo1ja68dmg2eIoU6lqQmOeMq"
)

stream_tweets(
  q = "@BernieSanders,@ewarren,@KamalaHarris,@PeteButtigieg,@JoeBiden",
  timeout = 30,
  file_name = "candidates.json",
  parse = FALSE
)

keywords <- parse_stream("candidates.json")



test<-c("Washington, DC","ACdc","FUCK")
str_detect(test," DC")

bernie_tweets <- search_tweets("@BernieSanders", n = 10000, verbose = TRUE, retryonratelimit = TRUE)

all_tweets <- search_tweets(lang="en",q="@BernieSanders OR @ewarren OR @KamalaHarris OR @PeteButtigieg OR @JoeBiden", n = 1000)

bernie_tweets$BS_IA<-(str_detect(bernie_tweets$location," IA") | str_detect(bernie_tweets$location,"Iowa")) & str_detect(bernie_tweets$text,"@BernieSanders")

IA_bernie<-bernie_tweets %>% filter(BS_IA=="TRUE")




tidy_bernie_tweets<- bernie_tweets %>%
  select(created_at,text) %>%
  unnest_tokens("word", text)

tidy_bernie_tweets %>%
  count(word) %>%
  arrange(desc(n))

data("stop_words")
tidy_bernie_tweets<-tidy_bernie_tweets %>%
  anti_join(stop_words)

tidy_bernie_tweets %>%
  count(word) %>%
  arrange(desc(n))

bernie_corpus <- Corpus(VectorSource(as.vector(bernie_tweets$text))) 
bernie_corpus

bernie_corpus <- tm_map(bernie_corpus, removeWords, stopwords("english"))



sentiments <- analyzeSentiment(as.character(bernie_corpus))


#make sure lang=en (english Tweet)
#make sure correct geolocation #location
#some will say City, ST , other will say State, USA
#https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json
