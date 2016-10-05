library(wordcloud2); library(stringr)
wordcloud2(data = demoFreq)
setwd('J:/GitProjects/WordCloud')
text <- paste(readLines("AllPapers.txt"), collapse=" ")
words <- strsplit(text, "[.!(),'/ ]")[[1]]
words <- words[words != ""]
words = tolower(words)
words = noquote(words)
words <- words[!(words %in% c("and", "the", "you", "to", "a", "is", "of", "in", "are","0","=","1","2016","25","A","71","900","295","be","2","3",
                              "by","l","4","m",'lâ€ 1',"iii","or","j","mi2","have","s","km2","mg","lâ€“1","on","10","for",
                              "n","with","1","al","all","as","d","et","from","figure","may","other","<NA>","use","which","www",
                              "were","less","7","6","an","+","we","5","9","c","at","g","8","2012","2013","also","such","org"))]
words = str_replace_all(words, "[[:punct:]]", " ")
word_freq <- as.data.frame(table(words))
head(word_freq)
word_freq = word_freq[word_freq$Freq > 20,]
word_freq$words = as.character(word_freq$words)
word_freq$words[word_freq$words=="r"] = "R"
word_freq$words[word_freq$words=="nrsa"] = "NRSA"
word_freq$words[word_freq$words=="omernik"] = "Omernik"
word_freq$words[word_freq$words=="carr"] = "Carr"
wordcloud2(data=word_freq)
