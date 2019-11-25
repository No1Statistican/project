library(rtweet)
library(tidyverse)
library(ggmap)
library(dplyr)
library(tm)
library(tidytext)
library(SentimentAnalysis)
library(textdata)

create_token(
  app = "Twitter API String Tracker",
  consumer_key = "rCVjASAtmlConQfTd1R6XjOTx",
  consumer_secret = "ysYiFKXE2rdE2LOH2dp7Ow1tiiciNBR1Bz5uXMPKJghd1cLbkE",
  access_token = "843482256803020809-K20s6YXiVp6DEohoK0AUo11n3mLlPXI",
  access_secret = "zWaW1TE4OcUL8TcLqGNQxyo1ja68dmg2eIoU6lqQmOeMq"
)

#stream_tweets(
#  q = "@BernieSanders,@ewarren,@KamalaHarris,@PeteButtigieg,@JoeBiden",
#  timeout = 30,
#  file_name = "candidates.json",
#  parse = FALSE
#)

#keywords <- parse_stream("candidates.json")

all_tweets <- search_tweets("@BernieSanders  OR @ewarren OR @KamalaHarris OR @PeteButtigieg OR @JoeBiden", n = 500000, verbose = TRUE, retryonratelimit = TRUE)
  
myvars <- c("text", "location", "created_at")
all_tweets_cut <- all_tweets[myvars]

all_tweets_cut$BS_IA<-(str_detect(all_tweets$location," IA") | str_detect(all_tweets$location,"Iowa")) & str_detect(all_tweets$text,"@BernieSanders")
all_tweets_cut$BS_NH<-(str_detect(all_tweets$location," NH") | str_detect(all_tweets$location,"New Hampshire")) & str_detect(all_tweets$text,"@BernieSanders")
all_tweets_cut$BS_SC<-(str_detect(all_tweets$location," SC") | str_detect(all_tweets$location,"South Carolina")) & str_detect(all_tweets$text,"@BernieSanders")
all_tweets_cut$BS_NV<-(str_detect(all_tweets$location," NV") | str_detect(all_tweets$location,"Nevada")) & str_detect(all_tweets$text,"@BernieSanders")


all_tweets_cut$EW_IA<-(str_detect(all_tweets$location," IA") | str_detect(all_tweets$location,"Iowa")) & str_detect(all_tweets$text,"@ewarren")
all_tweets_cut$EW_NH<-(str_detect(all_tweets$location," NH") | str_detect(all_tweets$location,"New Hampshire")) & str_detect(all_tweets$text,"@ewarren")
all_tweets_cut$EW_SC<-(str_detect(all_tweets$location," SC") | str_detect(all_tweets$location,"South Carolina")) & str_detect(all_tweets$text,"@ewarren")
all_tweets_cut$EW_NV<-(str_detect(all_tweets$location," NV") | str_detect(all_tweets$location,"Nevada")) & str_detect(all_tweets$text,"@ewarren")

all_tweets_cut$KH_IA<-(str_detect(all_tweets$location," IA") | str_detect(all_tweets$location,"Iowa")) & str_detect(all_tweets$text,"@KamalaHarris")
all_tweets_cut$KH_NH<-(str_detect(all_tweets$location," NH") | str_detect(all_tweets$location,"New Hampshire")) & str_detect(all_tweets$text,"@KamalaHarris")
all_tweets_cut$KH_SC<-(str_detect(all_tweets$location," SC") | str_detect(all_tweets$location,"South Carolina")) & str_detect(all_tweets$text,"@KamalaHarris")
all_tweets_cut$KH_NV<-(str_detect(all_tweets$location," NV") | str_detect(all_tweets$location,"Nevada")) & str_detect(all_tweets$text,"@KamalaHarris")

all_tweets_cut$PB_IA<-(str_detect(all_tweets$location," IA") | str_detect(all_tweets$location,"Iowa")) & str_detect(all_tweets$text,"@PeteButtigieg")
all_tweets_cut$PB_NH<-(str_detect(all_tweets$location," NH") | str_detect(all_tweets$location,"New Hampshire")) & str_detect(all_tweets$text,"@PeteButtigieg")
all_tweets_cut$PB_SC<-(str_detect(all_tweets$location," SC") | str_detect(all_tweets$location,"South Carolina")) & str_detect(all_tweets$text,"@PeteButtigieg")
all_tweets_cut$PB_NV<-(str_detect(all_tweets$location," NV") | str_detect(all_tweets$location,"Nevada")) & str_detect(all_tweets$text,"@PeteButtigieg")

all_tweets_cut$JB_IA<-(str_detect(all_tweets$location," IA") | str_detect(all_tweets$location,"Iowa")) & str_detect(all_tweets$text,"@JoeBiden")
all_tweets_cut$JB_NH<-(str_detect(all_tweets$location," NH") | str_detect(all_tweets$location,"New Hampshire")) & str_detect(all_tweets$text,"@JoeBiden")
all_tweets_cut$JB_SC<-(str_detect(all_tweets$location," SC") | str_detect(all_tweets$location,"South Carolina")) & str_detect(all_tweets$text,"@JoeBiden")
all_tweets_cut$JB_NV<-(str_detect(all_tweets$location," NV") | str_detect(all_tweets$location,"Nevada")) & str_detect(all_tweets$text,"@JoeBiden")

BS_IA<-all_tweets_cut %>% filter(BS_IA=="TRUE")
BS_NH<-all_tweets_cut %>% filter(BS_NH=="TRUE")
BS_SC<-all_tweets_cut %>% filter(BS_SC=="TRUE")
BS_NV<-all_tweets_cut %>% filter(BS_NV=="TRUE")

EW_IA<-all_tweets_cut %>% filter(EW_IA=="TRUE")
EW_NH<-all_tweets_cut %>% filter(EW_NH=="TRUE")
EW_SC<-all_tweets_cut %>% filter(EW_SC=="TRUE")
EW_NV<-all_tweets_cut %>% filter(EW_NV=="TRUE")

KH_IA<-all_tweets_cut %>% filter(KH_IA=="TRUE")
KH_NH<-all_tweets_cut %>% filter(KH_NH=="TRUE")
KH_SC<-all_tweets_cut %>% filter(KH_SC=="TRUE")
KH_NV<-all_tweets_cut %>% filter(KH_NV=="TRUE")

PB_IA<-all_tweets_cut %>% filter(PB_IA=="TRUE")
PB_NH<-all_tweets_cut %>% filter(PB_NH=="TRUE")
PB_SC<-all_tweets_cut %>% filter(PB_SC=="TRUE")
PB_NV<-all_tweets_cut %>% filter(PB_NV=="TRUE")

JB_IA<-all_tweets_cut %>% filter(JB_IA=="TRUE")
JB_NH<-all_tweets_cut %>% filter(JB_NH=="TRUE")
JB_SC<-all_tweets_cut %>% filter(JB_SC=="TRUE")
JB_NV<-all_tweets_cut %>% filter(JB_NV=="TRUE")

tidy_all_tweets_cut<- all_tweets_cut %>%
  select(created_at,text) %>%
  unnest_tokens("word", text)

tidy_all_tweets_cut %>%
  count(word) %>%
  arrange(desc(n))

data("stop_words")
tidy_all_tweets_cut<-tidy_all_tweets_cut%>%
  anti_join(stop_words)

tidy_all_tweets_cut %>%
  count(word) %>%
  arrange(desc(n))

all_tweets_cut_corpus <- Corpus(VectorSource(as.vector(all_tweets_cut$text))) 
all_tweets_cut_corpus

all_tweets_cut_corpus <- tm_map(all_tweets_cut_corpus, removeWords, stopwords("english"))

usableText=str_replace_all(all_tweets_cut$text, "[^[:alnum:]]", " ")
Encoding(usableText)  <- "UTF-8"
sentiments <- analyzeSentiment(as.character(usableText))

new_sentiments <- tidy_all_tweets_cut %>%
  inner_join(get_sentiments("bing")) %>%
  group_by(sentiment) %>%
  summarise(word_count = n())






#make sure lang=en (english Tweet)
#make sure correct geolocation #location
#some will say City, ST , other will say State, USA
#https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json
