EW_IA_sent <- analyzeSentiment(EW_IA_filter$text)
EW_IA_sent$Sentiment<-ifelse(EW_IA_sent$SentimentGI>0,"Pos",ifelse(EW_IA_sent$SentimentGI<0,"Neg","Neut"))


KH_IA_sent <- analyzeSentiment(KH_IA_filter$text)
KH_IA_sent$Sentiment<-ifelse(KH_IA_sent$SentimentGI>0,"Pos",ifelse(KH_IA_sent$SentimentGI<0,"Neg","Neut"))


PB_IA_sent <- analyzeSentiment(PB_IA_filter$text)
PB_IA_sent$Sentiment<-ifelse(PB_IA_sent$SentimentGI>0,"Pos",ifelse(PB_IA_sent$SentimentGI<0,"Neg","Neut"))


JB_IA_sent <- analyzeSentiment(JB_IA_filter$text)
JB_IA_sent$Sentiment<-ifelse(JB_IA_sent$SentimentGI>0,"Pos",ifelse(JB_IA_sent$SentimentGI<0,"Neg","Neut"))


BS_NH_sent <- analyzeSentiment(BS_NH_filter$text)
BS_NH_sent$Sentiment<-ifelse(BS_NH_sent$SentimentGI>0,"Pos",ifelse(BS_NH_sent$SentimentGI<0,"Neg","Neut"))

EW_NH_sent <- analyzeSentiment(EW_NH_filter$text)
EW_NH_sent$Sentiment<-ifelse(EW_NH_sent$SentimentGI>0,"Pos",ifelse(EW_NH_sent$SentimentGI<0,"Neg","Neut"))

KH_NH_sent <- analyzeSentiment(KH_NH_filter$text)
KH_NH_sent$Sentiment<-ifelse(KH_NH_sent$SentimentGI>0,"Pos",ifelse(KH_NH_sent$SentimentGI<0,"Neg","Neut"))


PB_NH_sent <- analyzeSentiment(PB_NH_filter$text)
PB_NH_sent$Sentiment<-ifelse(PB_NH_sent$SentimentGI>0,"Pos",ifelse(PB_NH_sent$SentimentGI<0,"Neg","Neut"))


JB_NH_sent <- analyzeSentiment(JB_NH_filter$text)
JB_NH_sent$Sentiment<-ifelse(JB_NH_sent$SentimentGI>0,"Pos",ifelse(JB_NH_sent$SentimentGI<0,"Neg","Neut"))


BS_SC_sent <- analyzeSentiment(BS_SC_filter$text)
BS_SC_sent$Sentiment<-ifelse(BS_SC_sent$SentimentGI>0,"Pos",ifelse(BS_SC_sent$SentimentGI<0,"Neg","Neut"))


EW_SC_sent <- analyzeSentiment(EW_SC_filter$text)
EW_SC_sent$Sentiment<-ifelse(EW_SC_sent$SentimentGI>0,"Pos",ifelse(EW_SC_sent$SentimentGI<0,"Neg","Neut"))


KH_SC_sent <- analyzeSentiment(KH_SC_filter$text)
KH_SC_sent$Sentiment<-ifelse(KH_SC_sent$SentimentGI>0,"Pos",ifelse(KH_SC_sent$SentimentGI<0,"Neg","Neut"))


PB_SC_sent <- analyzeSentiment(PB_SC_filter$text)
PB_SC_sent$Sentiment<-ifelse(PB_SC_sent$SentimentGI>0,"Pos",ifelse(PB_SC_sent$SentimentGI<0,"Neg","Neut"))


JB_SC_sent <- analyzeSentiment(JB_SC_filter$text)
JB_SC_sent$Sentiment<-ifelse(JB_SC_sent$SentimentGI>0,"Pos",ifelse(JB_SC_sent$SentimentGI<0,"Neg","Neut"))


BS_NV_sent <- analyzeSentiment(BS_NV_filter$text)
BS_NV_sent$Sentiment<-ifelse(BS_NV_sent$SentimentGI>0,"Pos",ifelse(BS_NV_sent$SentimentGI<0,"Neg","Neut"))

EW_NV_sent <- analyzeSentiment(EW_NV_filter$text)
EW_NV_sent$Sentiment<-ifelse(EW_NV_sent$SentimentGI>0,"Pos",ifelse(EW_NV_sent$SentimentGI<0,"Neg","Neut"))

KH_NV_sent <- analyzeSentiment(KH_NV_filter$text)
KH_NV_sent$Sentiment<-ifelse(KH_NV_sent$SentimentGI>0,"Pos",ifelse(KH_NV_sent$SentimentGI<0,"Neg","Neut"))

PB_NV_sent <- analyzeSentiment(PB_NV_filter$text)
PB_NV_sent$Sentiment<-ifelse(PB_NV_sent$SentimentGI>0,"Pos",ifelse(PB_NV_sent$SentimentGI<0,"Neg","Neut"))

JB_NV_sent <- analyzeSentiment(JB_NV_filter$text)
JB_NV_sent$Sentiment<-ifelse(JB_NV_sent$SentimentGI>0,"Pos",ifelse(JB_NV_sent$SentimentGI<0,"Neg","Neut"))
