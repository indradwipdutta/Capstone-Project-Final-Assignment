library(tm)
library(XML)

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

#load("Ngrams.RData")

predFn<-function(userInput){
  
  #Regex_Ip<-gsub(" ","",paste("^",userInput))
  #Regex_Ip<-paste("^",paste(userInput," "),sep = "")
  #Regex_Ip<-paste("^",userInput,sep = "")
  
  #Filter.userInpuserut<-grepl(Regex_Ip,gram1$Words)
  predwords<-data.frame()
  ln<-word_count(userInput)
  
  
  
 ############### 
  if (ln>4){
    
    userInput<-str_split(userInput," ")
    nx<-lengths(userInput)
    userInput<-paste(userInput[[1]][nx-3],userInput[[1]][nx-2],userInput[[1]][nx-1],userInput[[1]][nx])
    
    ln<-word_count(userInput)
  }
  
#####################  
  if (ln==4){
    
    userInput.gram4<-gram4[gram4$Words==userInput,]
    Filter.userInput.gram5<-grepl(paste("^",userInput,sep = ""),gram5$Words)
    predwords<-gram5[Filter.userInput.gram5,]
    predwords$Words<-as.character(predwords$Words)
    
    
    if (nrow(userInput.gram4)!=0 && nrow(predwords)!=0){
    P.userInput.gram4<-as.numeric(userInput.gram4$P)
    predwords<-data.frame(Words=predwords$Words,CP=predwords$P/P.userInput.gram4)
    predwords<-predwords[order(predwords$CP,decreasing = TRUE),]
    #predwords<-head(predwords$Words,10)
    }
    
    else {  
      
      userInput<-str_split(userInput," ")
      nx<-lengths(userInput)
      userInput<-paste(userInput[[1]][nx-2],userInput[[1]][nx-1],userInput[[1]][nx])
      
      ln<-word_count(userInput)
          }
    
  }
  
##############  
  
  if (ln==3){
    
    userInput.gram3<-gram3[gram3$Words==userInput,]
    Filter.userInput.gram4<-grepl(paste("^",userInput,sep = ""),gram4$Words)
    predwords<-gram4[Filter.userInput.gram4,]
    predwords$Words<-as.character(predwords$Words)
    
    if (nrow(userInput.gram3)!=0 && nrow(predwords)!=0 ){
      P.userInput.gram3<-as.numeric(userInput.gram3$P)
      predwords<-data.frame(Words=predwords$Words,CP=predwords$P/P.userInput.gram3)
      predwords<-predwords[order(predwords$CP,decreasing = TRUE),]
      #predwords<-head(predwords$Words,10)
    }
    
    else {  
      
      userInput<-str_split(userInput," ")
      nx<-lengths(userInput)
      userInput<-paste(userInput[[1]][nx-1],userInput[[1]][nx])
      ln<-word_count(userInput)
          }
    
  }
#####################
  
  if (ln==2){
    
    userInput.gram2<-gram2[gram2$Words==userInput,]
    Filter.userInput.gram3<-grepl(paste("^",userInput,sep = ""),gram3$Words)
    predwords<-gram3[Filter.userInput.gram3,]
    predwords$Words<-as.character(predwords$Words)
    
    if (nrow(userInput.gram2)!=0 && nrow(predwords)!=0){
      P.userInput.gram2<-as.numeric(userInput.gram2$P)
      predwords<-data.frame(Words=predwords$Words,CP=predwords$P/P.userInput.gram2)
      predwords<-predwords[order(predwords$CP,decreasing = TRUE),]
      #predwords<-head(predwords$Words,10)
    }
    
    else {  
      
      userInput<-str_split(userInput," ")
      nx<-lengths(userInput)
      userInput<-paste(userInput[[1]][nx])
      ln<-word_count(userInput)
          }
    
    
  }
 ############################# 
  
  
  
  if (ln==1){
    
    userInput.gram1<-gram1[gram1$Words==userInput,]
    Filter.userInput.gram2<-grepl(paste("^",userInput," ",sep = ""),gram2$Words)
    predwords<-gram2[Filter.userInput.gram2,]
    predwords$Words<-as.character(predwords$Words)
    
    if (nrow(userInput.gram1)!=0 && nrow(predwords)!=0 ){
      P.userInput.gram1<-as.numeric(userInput.gram1$P)
      predwords<-data.frame(Words=predwords$Words,CP=predwords$P/P.userInput.gram1)
      predwords<-predwords[order(predwords$CP,decreasing = TRUE),]
      #predwords<-head(predwords$Words,10)
    }
  }
  
  
  
  predwords   
    
}
  

  
  
  
  #return(str_extract(predwords))
  
  
