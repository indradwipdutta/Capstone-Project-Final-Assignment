


dsGram<-function(ds1,ds2,ds3,No.of.Samples=10,Size.Sample=1000) {
 
  Installedpacs <- c("tm", 
                     "XML",
                     "wordcloud",
                     "RColorBrewer",
                     "caret","NLP", 
                     "openNLP",
                     "RWeka",
                     "qdap",
                     "ggplot2",
                     "stringi", 
                     "stringr",
                     "SnowballC",
                     "textcat",
                     "dplyr")
  
  if (length(setdiff(Installedpacs, rownames(installed.packages()))) > 0) {
    install.packages(setdiff(Installedpacs, rownames(installed.packages())))  
  }
  
  library(tm)
  library(XML)
  library(dplyr)
  library(wordcloud)
  library(RColorBrewer)
  library(caret)
  library(NLP)
  library(openNLP)
  library(RWeka)
  library(qdap)
  library(ggplot2)
  library(stringi)
  library(stringr)
  library(magrittr)
  library(SnowballC)
  library(textcat)
  
  source("NTokenizer.R") 
  
  gram1<-data.frame()
  gram2<-data.frame()
  gram3<-data.frame()
  gram4<-data.frame()
  gram5<-data.frame()
  
  for (i in 1:No.of.Samples)
    
  {
    
    Sample.ds1<- sample(ds1,Size.Sample);ds1<-ds1[!ds1%in%Sample.ds1]
    Sample.ds2 <- sample(ds2,Size.Sample);ds2<-ds2[!ds2%in%Sample.ds2]
    Sample.ds3 <- sample(ds3,Size.Sample);ds3<-ds3[!ds1%in%Sample.ds3]
    sampCombined <- c(Sample.ds1,Sample.ds2,Sample.ds3) 
    sampCombined<-iconv(sampCombined, 'UTF-8', 'ASCII')
    corpus <- sent_detect(sampCombined,language="en",model=NULL)
    corpus <- removeNumbers(corpus)
    corpus <- removePunctuation(corpus)
    corpus <- stripWhitespace(corpus)
    corpus <- tolower(corpus)
    corpus <- corpus[which(corpus!="")]
    corpus <- data.frame(corpus,stringsAsFactors = FALSE)
    
    gm1 <- NTokenizer(corpus,1)
    gm2 <- NTokenizer(corpus,2)
    gm3 <- NTokenizer(corpus,3)
    gm4 <- NTokenizer(corpus,4)
    gm5 <- NTokenizer(corpus,5)
    
    
    gram1 <- rbind(gram1,gm1)
    gram2 <- rbind(gram2,gm2)
    gram3 <- rbind(gram3,gm3)
    gram4 <- rbind(gram4,gm4)
    gram5 <- rbind(gram5,gm5)
    
    remove(Sample.ds1,Sample.ds2,Sample.ds3,sampCombined,corpus,gm2,gm3,gm4,gm5)  
  }
  
  gram1$Words<-as.character(gram1$Words)
  gram2$Words<-as.character(gram2$Words)
  gram3$Words<-as.character(gram3$Words)
  gram4$Words<-as.character(gram4$Words)
  gram5$Words<-as.character(gram5$Words)
  
  gram1<-aggregate(Count~Words,data=gram1,sum)
  gram1<-data.frame(Words=gram1$Words,P=(gram1$Count/sum(gram1$Count)))
  gram1<-gram1[order(gram1$P,decreasing = TRUE),]
  # 
  # 
  gram2<-aggregate(Count~Words,data=gram2,sum)
  gram2<-data.frame(Words=gram2$Words,P=(gram2$Count/sum(gram2$Count)))
  gram2<-gram2[order(gram2$P,decreasing = TRUE),]
  # 
  gram3<-aggregate(Count~Words,data=gram3,sum)
  gram3<-data.frame(Words=gram3$Words,P=(gram3$Count/sum(gram3$Count)))
  gram3<-gram3[order(gram3$P,decreasing = TRUE),]
  # 
  gram4<-aggregate(Count~Words,data=gram4,sum)
  gram4<-data.frame(Words=gram4$Words,P=(gram4$Count/sum(gram4$Count)))
  gram4<-gram4[order(gram4$P,decreasing = TRUE),]
  # 
  gram5<-aggregate(Count~Words,data=gram5,sum)
  gram5<-data.frame(Words=gram5$Words,P=(gram5$Count/sum(gram5$Count)))
  gram5<-gram5[order(gram5$P,decreasing = TRUE),]
  
  save(gram1,gram2,gram3,gram4,gram5,file="NGrams.RData")
  
  remove(ds1,ds2,ds3,gram1,gram2,gram3,gram4,gram5)
  
  
  
}