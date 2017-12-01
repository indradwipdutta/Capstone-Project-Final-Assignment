# Coursera DataScience Capstone Slide Deck : Project Predicting the next word of a sentence at a web interface
#### author:Indradwip Dutta 
#### date: 12/1/2017
## The Data Product Web App mainly predicts the next word in a sentence,when typed into an user input.

Contents
========================================================
Here,I brief on mainly on the following aspects of the Data Product Web Appllication

- describe the app and give instructions and describe how the app functions

- description of the Algorithm used to make the prediction Model has been worked out

- description of the R Codes and Datasets on which prediction Model has been worked out

Application Description and Instructions
========================================================
### The user would type in a word of his choice in the input text box provided at the top of first page of the application.As soon as the text is enterred,the next most probable  words are predicted and shown in the table of predcited suggestions of words,below.The CP column in te table is actually the conditional probalilty of the words in the descending order.

The most probable word comes first.The most probale,first six words are shown in the six  blue notification boxes ,just below the input box.

Each of the light blue buttons with cube icons,correspond to the predicted words,one to six.User can select one of the predicted words by pressing the corresponding select button.

The model would then predict the next word,post the selected word above.This again is displayed in the suggestions below and also in the table.


Alternatively,user can paste any sentence directly into the text box and this would predict the next most probable words for the sentence.

Link to Shiny Data Product App:

<https://iduttacoursera2017.shinyapps.io/CourseraDataScience_Capstone_WordPredict_ShinyApp/>

Background of the Algorithm
========================================================
<small style="font-size:.6em">
The conditional probability of an event A given that an event B has occurred (where P(B) > 0) is 

P(A|B) = P(A intersect B)/P(B)

This can be rewritten as the product rule:

P(A intersect B) = P(B) P(A|B)"),
            
 The probability of seeing a word Wn,given the previous words,"W1,W2, . . .Wn_1 is:
 
 P(Wn | W1 . . .Wn_1) = P(W1 . . .Wn) x P(W1 . . .Wn_1)").
 
The individual probablities of words:

P(W1)=(Count of W1 ocurence)/ (Total count of words)")


The words mentioned can be a single word as in an unigram  or a combination of words,as in bi-gram,tri-gram,tetra-gram,etc.Here I have created these NGrams from a Corpus of Texts.Source of the corpus is Coursera-SwiftKey Dataset with text data files,'en_US.blogs.txt','en_US.news.txt','en_US.twitter.txt'.
The conditional probablities of every word has been calculated and shown as CP in the Table of predicted words in the Text Predict Tab.Predicted words shown the highest probablities to the lowest.

R Codes and Datasets
========================================================
<small style="font-size:.6em">
Code Function 'dsGrams.R' is called from 'Read_CollectTokens.R' to create database 'NGrams.RData' with Unigram,Bigram,Trigram,Tetragram,Pentagram.Data Source of corpus is Coursera-SwiftKey Dataset with text data files,'en_US.blogs.txt','en_US.news.txt','en_US.twitter.txt'

```{r Read Data Text Files and Call NGram generating function,eval=FALSE,echo=TRUE}
##load libraries

library(tm);library(XML);library(dplyr);library(wordcloud);
library(RColorBrewer);library(caret);library(NLP);library(openNLP);
library(RWeka);library(qdap);library(ggplot2);library(stringi);
library(stringr);library(magrittr);library(SnowballC);
library(textcat)

##Read Datasets and close connections

ds.blogs <- readLines(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.blogs.txt"))
ds.news <- readLines(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.news.txt"))
ds.twitter <- readLines(unz("./Coursera-SwiftKey.zip", "final/en_US/en_US.twitter.txt"))

##Call the NGram generating "function dsGram.R".It Generates the database "NGram.RData"
source("dsGram.R")
dsGram(ds.blogs,ds.news,ds.twitter,5,1000) 
#Load the RData set
load("NGram.RData")
```
This NGram.RData,which contains the NGrams named,gram1,gram2,gram3,gram4,gram5 are used for the prediction,using conditional probalility  of the words.

### The part structure of the "dsGram.R" code function is as below,the full code is available in this Repo separately

```{r NGram generating function,eval=FALSE,echo=TRUE}

dsGram<-function(ds1,ds2,ds3,No.of.Samples=10,Size.Sample=1000) {
 
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
```
The Dataset names are passed to this function and also the number of times to sample the huge datasets in parts of sample size,say 1000 lines,without replacement back of the lines to original dataset.
The final NGram.RData size can be controlled by calling this 'dsGram.R' code from 'Read_CollectTokens.R' and varying the values of No.of.Samples=10,Size.Sample=1000 in the function call.The larger MB size of the NGram.RData would mean better accuracy of the model,but for this assignment,it has been kept small,so that it can be hosted in Shiny Apps io web server,with a free account.
