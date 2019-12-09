#Iowa
tweets_IA_EW <- filter(tweets_IA, str_detect(txt_clean, paste(EW_filter)))
tweets_IA_KH <- filter(tweets_IA, str_detect(txt_clean, paste(KH_filter)))
tweets_IA_PB <- filter(tweets_IA, str_detect(txt_clean, paste(PB_filter)))
tweets_IA_JB <- filter(tweets_IA, str_detect(txt_clean, paste(JB_filter)))
#New Hampshire
tweets_NH_BS <- filter(tweets_NH, str_detect(txt_clean, paste(BS_filter)))
tweets_NH_EW <- filter(tweets_NH, str_detect(txt_clean, paste(EW_filter)))
tweets_NH_KH <- filter(tweets_NH, str_detect(txt_clean, paste(KH_filter)))
tweets_NH_PB <- filter(tweets_NH, str_detect(txt_clean, paste(PB_filter)))
tweets_NH_JB <- filter(tweets_NH, str_detect(txt_clean, paste(JB_filter)))
#South Carolina
tweets_SC_BS <- filter(tweets_SC, str_detect(txt_clean, paste(BS_filter)))
tweets_SC_EW <- filter(tweets_SC, str_detect(txt_clean, paste(EW_filter)))
tweets_SC_KH <- filter(tweets_SC, str_detect(txt_clean, paste(KH_filter)))
tweets_SC_PB <- filter(tweets_SC, str_detect(txt_clean, paste(PB_filter)))
tweets_SC_JB <- filter(tweets_SC, str_detect(txt_clean, paste(JB_filter)))
#Nevada
tweets_NV_BS <- filter(tweets_NV, str_detect(txt_clean, paste(BS_filter)))
tweets_NV_EW <- filter(tweets_NV, str_detect(txt_clean, paste(EW_filter)))
tweets_NV_KH <- filter(tweets_NV, str_detect(txt_clean, paste(KH_filter)))
tweets_NV_PB <- filter(tweets_NV, str_detect(txt_clean, paste(PB_filter)))
tweets_NV_JB <- filter(tweets_NV, str_detect(txt_clean, paste(JB_filter)))