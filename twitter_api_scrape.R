library(rtweet)
library(tidyverse)
library(tidytext)
library(ggmap)
library(dplyr)

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

bernie_tweets <- search_tweets("@BernieSanders", n = 100)
bernie_tweets

test<-c("Washington, DC","ACdc","FUCK")
str_detect(test," DC")


bernie_tweets <- search_tweets(lang="en",q="@BernieSanders", n = 10000)
bernie_tweets$IA<-str_detect(bernie_tweets$location," IA") | str_detect(bernie_tweets$location,"Iowa")
dc_bernie<-bernie_tweets %>% filter(IA=="TRUE")


#make sure lang=en (english Tweet)
#make sure correct geolocation #location
#some will say City, ST , other will say State, USA
#https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json
