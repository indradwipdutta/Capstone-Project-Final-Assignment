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


ds.blogs <- readLines(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.blogs.txt"))
ds.news <- readLines(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.news.txt"))
ds.twitter <- readLines(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.twitter.txt"))

close.connection(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.blogs.txt")) 
close.connection(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.news.txt")) 
close.connection(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.twitter.txt")) 

source("dsGram.R")
#dsGram<-function(ds1,ds2,ds3,No_of_Samples=10,Size_Sample=1000) {
dsGram(ds.blogs,ds.news,ds.twitter,4,1000)  

