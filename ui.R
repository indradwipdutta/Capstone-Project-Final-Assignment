#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)



#shinyUI(




sidebar<-dashboardSidebar(
  
  sidebarMenu(
    #menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    #menuItem("Widgets", tabName = "widgets", icon = icon("th")),
    menuItem("Text Predict", tabName = "TextPredict", icon = icon("cubes")),
    menuItem("How it works", tabName = "Howitworks", icon = icon("book")),
    menuItem("Background", tabName = "Background", icon = icon("book")),
    menuItem("Model Workout", tabName = "ModelWorkout", icon = icon("book")),
    menuItem("Word Grams A", tabName = "WordGramsA", icon = icon("database")),
    menuItem("Word Grams B", tabName = "WordGramsB", icon = icon("database"))
    #menuItem("Widgets", tabName = "How it works", icon = icon("th"))
  )
  
)         



body<-dashboardBody( 
################  
  tags$head(tags$style(
    HTML('#sidebar {background-color:#337ab7;}
                   body, label, input, button, select {
       font-family: "Arial";
       }')
  )
  ),
 ################## 
# tabItems(    
#   
#   
#   tabItem( tabName="dashboard",
#            
#            #fluidRow(
#            h4("user type in"))
#  
#   
# ),
  
titlePanel(h2("Type in any word or paste a sentence to predict the next word you are looking for",style="color:white;background-color:#337ab7;font-style:italic;text-align:center")),  

titlePanel(h4("Coursera Capstone Assignment Week7-Part1,Data Product:Shiny Application  |  Author:Indradwip Dutta",
                  style="color:white;font-style:italic;background-color:dodgerblue;text-align:center")), 
 ########################################### 
 sidebarLayout(

    sidebarPanel( id="sidebar",


                 h3("Type in your text input in the Input Box provided alongside:",style="color:white"),


                 h4("the most probable next word
        that you would type in should appear in the six suggestion tags below the text input area"
                    ,style="color:white;font-style:italic"),

                 h5("The table below shows all the suggested prediction of words in the order
           of highest probablity to the lowest.",style="color:white;width: 100%"),


                 h3(" link to documents ",
                    style="background-color:navy;color:white;width: 100%;text-align:center"),

                 h5(style="color:white","the link to all the project documents,
               containing the sever.R and ui.R codes,functions and codes to create N-Gram.RData,
                are at git-Hub link as below",
                    a(h4("Link to github",style="color:navy"), href="https://github.com/indradwipdutta/Capstone-Project-Final-Assignment")),

                 h3(" link to presentation ",
                    style="background-color:navy;color:white;width: 100%;text-align:center"),

                 h5(style="color:white","the link to the presentation that summarizes the
          project submission is as below",a(h4("Link to presentation",style="color:navy"),
                                            href="http://rpubs.com/indradwipdutta/Coursera-Data-Science-Capstone-Project-Predict-Next-Word-of-a-sentence"))
      
      ),
  mainPanel(
 #######################   
    
 tabItems(    
   
   
   tabItem( tabName="TextPredict",
            
            #fluidRow(
            textInput("user.Input","type in","type here",width = "98%"),
            #)
            
            
            h4(style="display: inline-block;vertical-align:top;background-color:dodgerblue;color:white;width: 15%;text-align:center",textOutput("pred.word1")),
            h4(style="display: inline-block;vertical-align:top;background-color:dodgerblue;color:white;width: 15%;text-align:center",textOutput("pred.word2")),
            h4(style="display: inline-block;vertical-align:top;background-color:dodgerblue;color:white;width: 15%;text-align:center",textOutput("pred.word3")),
            h4(style="display: inline-block;vertical-align:top;background-color:dodgerblue;color:white;width: 15%;text-align:center",textOutput("pred.word4")),
            h4(style="display: inline-block;vertical-align:top;background-color:dodgerblue;color:white;width: 15%;text-align:center",textOutput("pred.word5")),
            h4(style="display: inline-block;vertical-align:top;background-color:dodgerblue;color:white;width: 15%;text-align:center",textOutput("pred.word6")),
            # 
            h6(style="display: inline-block;vertical-align:top;width: 15%;text-align:center",
               actionButton("sel.pred.word1","sel Pred-1",icon("cube"), 
                            style="color: white; background-color:lightblue")),
            
            h6(style="display: inline-block;vertical-align:top;width: 15%;text-align:center",
               actionButton("sel.pred.word2","sel Pred-2",icon("cube"), 
                            style="color: white; background-color:lightblue")),
            
            h6(style="display: inline-block;vertical-align:top;width: 15%;text-align:center",
               actionButton("sel.pred.word3","sel Pred-3",icon("cube"),
                            style="color: white; background-color:lightblue")),
            
            h6(style="display: inline-block;vertical-align:top;width: 15%;text-align:center",
               actionButton("sel.pred.word4","sel Pred-4",icon("cube"),
                            style="color: white; background-color:lightblue")),
            
            h6(style="display: inline-block;vertical-align:top;width: 15%;text-align:center",
               actionButton("sel.pred.word5","sel Pred-5",icon("cube"),
                            style="color: white; background-color:lightblue")),
            
            h6(style="display: inline-block;vertical-align:top;width: 15%;text-align:center",
               actionButton("sel.pred.word6","sel Pred-6",icon("cube"),
                            style="color: white; background-color:lightblue")),
            
            h5(dataTableOutput("Pred.Output"),style="color:steelblue;background-color:beige")
            
            
            
            
   ), 
   #)
   
   
   tabItem( tabName="Howitworks",
            
            br(),
            h4(style="color:steelblue;"," The user would type in a word of his choice in the input text box
               at the top."),br(),
            
            h4(style="color:steelblue","As soon as the text is enterred,the next most probable
               words are predicted and shown in the table of predcited suggestions of words,below."),br(),
            
            h4(style="color:navy;","The CP column in te table is actually the conditional
               probalilty of the words in the descending order.The most probable word comes first,
               and the least at last"),br(),
            
            h4(style="color:navy;","The most probale,first six words are shown in the
               six  blue notification boxes ,just below the input box."),
            
            h3(style="color:navy;"," Each of the light blue buttons with cube icons,correspond
               to the predicted words,one to six."),
            
            h4(style="color:steelblue;"," User can select one of the predicted words by pressing
               the corresponding select button."),br(),
            
            h4(style="color:steelblue;"," The model would then predict the next word,post the
               selected word above.This again is displayed in the suggestions below and also in the table")
            
            ),     
   
   tabItem( tabName="Background",
            
            h4(style="color:steelblue;text-decoration:Underline"," The conditional probability of an event A"),
            h4(style="color:steelblue"," given that an event B has occurred (where P(B) > 0)"),
            h4(style="color:steelblue"," is defined as P(A|B) = P(A intersect B)/P(B)"),
            h4(style="color:steelblue"," This can be rewritten as the product rule: P(A intersect B) =
               P(B) P(A|B)"),
            
            h4(style="display: inline-block;color:steelblue;text-decoration:Underline",
               "The probability of seeing a word"),
            h3(style="display: inline-block;color:steelblue","Wn"),
            h4(style="display: inline-block;color:steelblue","given the previous words"),
            h3(style="display: inline-block;color:steelblue","W1,W2, . . .Wn_1 is:"),
            h3(style="color:steelblue","P(Wn | W1 . . .Wn_1) = P(W1 . . .Wn)xP(W1 . . .Wn_1)"),
            h4(style="color:steelblue;text-decoration:Underline","The individual probablities of words:"),
            h3(style="color:steelblue","P(W1)=(Count of W1 ocurence)/ (Total count of words)"),
            h4(style="color:steelblue","The words we mention can be a single word as in an unigram
               or a combination of words,as in bi-gram,tri-gram,tetra-gram,etc.")
            # h3(style="color:steelblue","In this assignment,we have created anUnigram,Bigram,Trigram,
            #    TertraGram and a Pentagram,froma Corpus ow Texts. "),
            # h4(style="color:steelblue","Source of the corpus is Coursera-SwiftKey Dataset
            #    that contains the text data files,'en_US.blogs.txt','en_US.news.txt','en_US.twitter.txt'"),
            # h4(style="color:steelblue","The conditional probablities of every word has been 
            #    calculated and shown as CP in the Table of predicted words in the Text Predict Tab.
            #    Predicted words are as per the highest probablities to the lowest")
            # 
           
            
            ),
   
   
   tabItem( tabName="ModelWorkout",
            
            h3(style="color:steelblue","In this assignment,we have created an Unigram,Bigram,Trigram,
               TertraGram and a Pentagram,from a Corpus of Texts. "),
            h4(style="color:steelblue","Source of the corpus is Coursera-SwiftKey Dataset
               that contains the text data files,'en_US.blogs.txt','en_US.news.txt','en_US.twitter.txt'"),
            h4(style="color:steelblue","The conditional probablities of every word has been 
               calculated and shown as CP in the Table of predicted words in the Text Predict Tab.
               Predicted words are as per the highest probablities to the lowest"),
            h3(style="color:steelblue","The 'NGrams.Rdata' database  created from running the code 
               'dsGram.R',being called from 'Read_CollectTokens.R' ,have been used as a source of
                words for prediction"),
            h4(style="color:steelblue","The function code 'dsGram.R' has been so written that,we can pass 
               the number of times to sample the text datasets without replacement and the size of the samples
               .This helps us to tune the numer of samplings and the sample sizes,which further helps control
               the size of 'NGram.RData'.The maximum size of dataset that can be loaded seems to be about 10 MB,
               and the local dataset created in Laptop is aroung 60 MB.This compromises the accuracy of the Model
               when hosted in shiny app Web")
            
            ),
   
   tabItem( tabName="WordGramsA",
            
            navlistPanel(
              
              "Uni-Gram Used",
              tabPanel("gram-1-words",h5("uni-Gram Words",textOutput('Gram1.summary'),dataTableOutput('Gram1'),style="color:steelblue")),
              
              br(),
              
              "Bi-Gram Used",
              tabPanel("gram-2-words",h5("bi-Gram Words",textOutput('Gram2.summary'),dataTableOutput('Gram2'),style="color:steelblue")),
              
              br(),
              
              "Tri-Gram Used",
              tabPanel("gram-3-words",h5("tri-Gram Words",textOutput('Gram3.summary'),dataTableOutput('Gram3'),style="color:steelblue"))
              
              
            )
            
   ),
   
   
   
   tabItem( tabName="WordGramsB",
            
            navlistPanel(
              
              
              "Tetra-Gram Used",
              tabPanel("gram-4-words",h5("tetra-Gram Words",textOutput('Gram4.summary'),dataTableOutput('Gram4'),style="color:steelblue")),
              
              br(),
              
              "Penta-Gram Used",
              tabPanel("gram-5-words",h5("penta-Gram Words",textOutput('Gram5.summary'),dataTableOutput('Gram5'),style="color:steelblue"))
            )
            
   )
   
   )
    
    
 #############
          )
   
  
  
  )
  
 
  
#################################  
  
)



ui <- dashboardPage(
  
  dashboardHeader(title = "Predict the Next word"),
  sidebar,
  body
)