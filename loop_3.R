#BS IA

#EW IA
EW_IA_corpus <- Corpus(VectorSource(as.vector(tweets_IA_EW$txt_clean))) 
EW_IA_corpus<-tm_map(EW_IA_corpus, content_transformer(tolower))
EW_IA_corpus <- tm_map(EW_IA_corpus, stripWhitespace) 
EW_IA_corpus <- tm_map(EW_IA_corpus, removeWords, c(stopwords("english"),remove))
EW_IA_filter<-data.frame(text = sapply(EW_IA_corpus, as.character), stringsAsFactors = FALSE)
#KH IA
KH_IA_corpus <- Corpus(VectorSource(as.vector(tweets_IA_KH$txt_clean))) 
KH_IA_corpus<-tm_map(KH_IA_corpus, content_transformer(tolower))
KH_IA_corpus <- tm_map(KH_IA_corpus, stripWhitespace) 
KH_IA_corpus <- tm_map(KH_IA_corpus, removeWords, c(stopwords("english"),remove))
KH_IA_filter<-data.frame(text = sapply(KH_IA_corpus, as.character), stringsAsFactors = FALSE)
#PB IA
PB_IA_corpus <- Corpus(VectorSource(as.vector(tweets_IA_PB$txt_clean))) 
PB_IA_corpus<-tm_map(PB_IA_corpus, content_transformer(tolower))
PB_IA_corpus <- tm_map(PB_IA_corpus, stripWhitespace) 
PB_IA_corpus <- tm_map(PB_IA_corpus, removeWords, c(stopwords("english"),remove))
PB_IA_filter<-data.frame(text = sapply(PB_IA_corpus, as.character), stringsAsFactors = FALSE)
#JB IA
JB_IA_corpus <- Corpus(VectorSource(as.vector(tweets_IA_JB$txt_clean))) 
JB_IA_corpus<-tm_map(JB_IA_corpus, content_transformer(tolower))
JB_IA_corpus <- tm_map(JB_IA_corpus, stripWhitespace) 
JB_IA_corpus <- tm_map(JB_IA_corpus, removeWords, c(stopwords("english"),remove))
JB_IA_filter<-data.frame(text = sapply(JB_IA_corpus, as.character), stringsAsFactors = FALSE)

#BS NH
BS_NH_corpus <- Corpus(VectorSource(as.vector(tweets_NH_BS$txt_clean))) 
BS_NH_corpus<-tm_map(BS_NH_corpus, content_transformer(tolower))
BS_NH_corpus <- tm_map(BS_NH_corpus, stripWhitespace) 
BS_NH_corpus <- tm_map(BS_NH_corpus, removeWords, c(stopwords("english"),remove))
BS_NH_filter<-data.frame(text = sapply(BS_NH_corpus, as.character), stringsAsFactors = FALSE)
#EW NH
EW_NH_corpus <- Corpus(VectorSource(as.vector(tweets_NH_EW$txt_clean))) 
EW_NH_corpus<-tm_map(EW_NH_corpus, content_transformer(tolower))
EW_NH_corpus <- tm_map(EW_NH_corpus, stripWhitespace) 
EW_NH_corpus <- tm_map(EW_NH_corpus, removeWords, c(stopwords("english"),remove))
EW_NH_filter<-data.frame(text = sapply(EW_NH_corpus, as.character), stringsAsFactors = FALSE)
#KH NH
KH_NH_corpus <- Corpus(VectorSource(as.vector(tweets_NH_KH$txt_clean))) 
KH_NH_corpus<-tm_map(KH_NH_corpus, content_transformer(tolower))
KH_NH_corpus <- tm_map(KH_NH_corpus, stripWhitespace) 
KH_NH_corpus <- tm_map(KH_NH_corpus, removeWords, c(stopwords("english"),remove))
KH_NH_filter<-data.frame(text = sapply(KH_NH_corpus, as.character), stringsAsFactors = FALSE)
#PB NH
PB_NH_corpus <- Corpus(VectorSource(as.vector(tweets_NH_PB$txt_clean))) 
PB_NH_corpus<-tm_map(PB_NH_corpus, content_transformer(tolower))
PB_NH_corpus <- tm_map(PB_NH_corpus, stripWhitespace) 
PB_NH_corpus <- tm_map(PB_NH_corpus, removeWords, c(stopwords("english"),remove))
PB_NH_filter<-data.frame(text = sapply(PB_NH_corpus, as.character), stringsAsFactors = FALSE)
#JB NH
JB_NH_corpus <- Corpus(VectorSource(as.vector(tweets_NH_JB$txt_clean))) 
JB_NH_corpus<-tm_map(JB_NH_corpus, content_transformer(tolower))
JB_NH_corpus <- tm_map(JB_NH_corpus, stripWhitespace) 
JB_NH_corpus <- tm_map(JB_NH_corpus, removeWords, c(stopwords("english"),remove))
JB_NH_filter<-data.frame(text = sapply(JB_NH_corpus, as.character), stringsAsFactors = FALSE)

#BS SC
BS_SC_corpus <- Corpus(VectorSource(as.vector(tweets_SC_BS$txt_clean))) 
BS_SC_corpus<-tm_map(BS_SC_corpus, content_transformer(tolower))
BS_SC_corpus <- tm_map(BS_SC_corpus, stripWhitespace) 
BS_SC_corpus <- tm_map(BS_SC_corpus, removeWords, c(stopwords("english"),remove))
BS_SC_filter<-data.frame(text = sapply(BS_SC_corpus, as.character), stringsAsFactors = FALSE)
#EW SC
EW_SC_corpus <- Corpus(VectorSource(as.vector(tweets_SC_EW$txt_clean))) 
EW_SC_corpus<-tm_map(EW_SC_corpus, content_transformer(tolower))
EW_SC_corpus <- tm_map(EW_SC_corpus, stripWhitespace) 
EW_SC_corpus <- tm_map(EW_SC_corpus, removeWords, c(stopwords("english"),remove))
EW_SC_filter<-data.frame(text = sapply(EW_SC_corpus, as.character), stringsAsFactors = FALSE)
#KH SC
KH_SC_corpus <- Corpus(VectorSource(as.vector(tweets_SC_KH$txt_clean))) 
KH_SC_corpus<-tm_map(KH_SC_corpus, content_transformer(tolower))
KH_SC_corpus <- tm_map(KH_SC_corpus, stripWhitespace) 
KH_SC_corpus <- tm_map(KH_SC_corpus, removeWords, c(stopwords("english"),remove))
KH_SC_filter<-data.frame(text = sapply(KH_SC_corpus, as.character), stringsAsFactors = FALSE)
#PB SC
PB_SC_corpus <- Corpus(VectorSource(as.vector(tweets_SC_PB$txt_clean))) 
PB_SC_corpus<-tm_map(PB_SC_corpus, content_transformer(tolower))
PB_SC_corpus <- tm_map(PB_SC_corpus, stripWhitespace) 
PB_SC_corpus <- tm_map(PB_SC_corpus, removeWords, c(stopwords("english"),remove))
PB_SC_filter<-data.frame(text = sapply(PB_SC_corpus, as.character), stringsAsFactors = FALSE)
#JB SC
JB_SC_corpus <- Corpus(VectorSource(as.vector(tweets_SC_JB$txt_clean))) 
JB_SC_corpus<-tm_map(JB_SC_corpus, content_transformer(tolower))
JB_SC_corpus <- tm_map(JB_SC_corpus, stripWhitespace) 
JB_SC_corpus <- tm_map(JB_SC_corpus, removeWords, c(stopwords("english"),remove))
JB_SC_filter<-data.frame(text = sapply(JB_SC_corpus, as.character), stringsAsFactors = FALSE)

#BS NV
BS_NV_corpus <- Corpus(VectorSource(as.vector(tweets_NV_BS$txt_clean))) 
BS_NV_corpus<-tm_map(BS_NV_corpus, content_transformer(tolower))
BS_NV_corpus <- tm_map(BS_NV_corpus, stripWhitespace) 
BS_NV_corpus <- tm_map(BS_NV_corpus, removeWords, c(stopwords("english"),remove))
BS_NV_filter<-data.frame(text = sapply(BS_NV_corpus, as.character), stringsAsFactors = FALSE)
#EW NV
EW_NV_corpus <- Corpus(VectorSource(as.vector(tweets_NV_EW$txt_clean))) 
EW_NV_corpus<-tm_map(EW_NV_corpus, content_transformer(tolower))
EW_NV_corpus <- tm_map(EW_NV_corpus, stripWhitespace) 
EW_NV_corpus <- tm_map(EW_NV_corpus, removeWords, c(stopwords("english"),remove))
EW_NV_filter<-data.frame(text = sapply(EW_NV_corpus, as.character), stringsAsFactors = FALSE)
#KH NV
KH_NV_corpus <- Corpus(VectorSource(as.vector(tweets_NV_KH$txt_clean))) 
KH_NV_corpus<-tm_map(KH_NV_corpus, content_transformer(tolower))
KH_NV_corpus <- tm_map(KH_NV_corpus, stripWhitespace) 
KH_NV_corpus <- tm_map(KH_NV_corpus, removeWords, c(stopwords("english"),remove))
KH_NV_filter<-data.frame(text = sapply(KH_NV_corpus, as.character), stringsAsFactors = FALSE)
#PB NV
PB_NV_corpus <- Corpus(VectorSource(as.vector(tweets_NV_PB$txt_clean))) 
PB_NV_corpus<-tm_map(PB_NV_corpus, content_transformer(tolower))
PB_NV_corpus <- tm_map(PB_NV_corpus, stripWhitespace) 
PB_NV_corpus <- tm_map(PB_NV_corpus, removeWords, c(stopwords("english"),remove))
PB_NV_filter<-data.frame(text = sapply(PB_NV_corpus, as.character), stringsAsFactors = FALSE)
#JB NV
JB_NV_corpus <- Corpus(VectorSource(as.vector(tweets_NV_JB$txt_clean))) 
JB_NV_corpus<-tm_map(JB_NV_corpus, content_transformer(tolower))
JB_NV_corpus <- tm_map(JB_NV_corpus, stripWhitespace) 
JB_NV_corpus <- tm_map(JB_NV_corpus, removeWords, c(stopwords("english"),remove))
JB_NV_filter<-data.frame(text = sapply(JB_NV_corpus, as.character), stringsAsFactors = FALSE)