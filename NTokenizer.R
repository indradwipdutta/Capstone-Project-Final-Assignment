

NTokenizer <- function(x,n) {
  
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
  
  
  Ntokens <- NGramTokenizer(x, Weka_control(min = n, max = n, delimiters = " \\r\\n\\t.,;:\"()?!"))
  tokenTable <- data.frame(table(Ntokens))
  colnames(tokenTable) <- c('Words','Count')
  tokenTable <- tokenTable[order(tokenTable$Count,decreasing = TRUE),]
  tokenTable
}