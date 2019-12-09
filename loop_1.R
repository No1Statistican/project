tweets_NH <- filter (all_tweets_cut, str_detect(location, paste(NH_filter, collapse="|")))
tweets_SC <- filter (all_tweets_cut, str_detect(location, paste(SC_filter, collapse="|")))
tweets_NV <- filter (all_tweets_cut, str_detect(location, paste(NV_filter, collapse="|")))