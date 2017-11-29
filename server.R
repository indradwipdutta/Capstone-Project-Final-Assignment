#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(gridExtra)
library(caret)
library(randomForest)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  #source("TestDatasetReadTxtFile.R")
  
   #source("TestDatasetSummary.R")
  
  #output$NGrams <- renderDataTable(head(gram_1),options = list(pageLength = 5) )
  #output$No_of_Suggestions<-renderText(length(gram_1$Words))
  
  #ChickParam<-reactive({
    
    #data.frame(Time=input$time,Chick=input$ChikType,Diet=input$dietType) 
    
  #})
  
  #output$QuestionChick<-renderDataTable(ChickParam())
  
  
  Inputwords<-reactive({
    
    predFn(input$user.Input)
                       
    })
  
  
  #output$Preds<- renderDataTable(data.frame(suggested=head(Inputwords(),5)),options = list(dom="t"))
  
  output$Pred.Output<- renderDataTable(data.frame(suggested=Inputwords()))
  
  
  
  #output$SuggestionsList<-eventReactive(input$test,{print("hi")})
  #predLastWord<-strsplit(head(as.character(Inputwords()$Words)))
  #output$pred.word1<-renderText(head(as.character(Inputwords()$Words))[1])
  #output$pred.word2<-renderText(head(as.character(Inputwords()$Words))[2])
  #output$pred.word3<-renderText(head(as.character(Inputwords()$Words))[3])
  #output$pred.word4<-renderText(head(as.character(Inputwords()$Words))[4])
  #output$pred.word5<-renderText(head(as.character(Inputwords()$Words))[5])
  #output$pred.word6<-renderText(head(as.character(Inputwords()$Words))[6])
  
  output$pred.word1<-renderText(strsplit(head(as.character(Inputwords()$Words))[1]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])])
  output$pred.word2<-renderText(strsplit(head(as.character(Inputwords()$Words))[2]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[2])])
  output$pred.word3<-renderText(strsplit(head(as.character(Inputwords()$Words))[3]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[3])])
  output$pred.word4<-renderText(strsplit(head(as.character(Inputwords()$Words))[4]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[4])])
  output$pred.word5<-renderText(strsplit(head(as.character(Inputwords()$Words))[5]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[5])])
  output$pred.word6<-renderText(strsplit(head(as.character(Inputwords()$Words))[6]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[6])])
  
  
  
  
  # observeEvent(input$testButton,
  #              
  #   {isolate({updateTextinput("user.Input.test",value=output$pred.word1)})
  #                
  #                
  #                })
    
  observeEvent(input$testButton,
               
               {updateTextinput("user.Input.test",value=output$pred.word1)})
                 
                 
               
  
  #observeEvent(input$Preds, {str(input$text_Input)})
  #observeEvent(input$Preds_rows_selected,{str(input$text_Input) <- input$Preds_selected_id})
  
  #observeEvent(output$Preds_rows_selected,{updateTextInput(session,"text_Input",value=output$Preds_rows_selected)})
  #input$text_Input<-observeEvent(input$Preds_rows_selected,{ input$Preds_rows_selected}) 
  #observeEvent(output$Preds_rows_selected,{renderText("text_Pred",value=output$Preds_rows_selected)})
  
  #observe({
    
    #isolate({ updateTextInput(session,"text_Input",value=output$Preds_rows_selected)})
     # })
  
  output$Gram1<- renderDataTable(head(gram1,5),options = list(dom="t"))
  output$Gram2<- renderDataTable(head(gram2,5),options = list(dom="t"))
  output$Gram3<- renderDataTable(head(gram3,5),options = list(dom="t"))
  output$Gram4<- renderDataTable(head(gram4,5),options = list(dom="t"))
  output$Gram5<- renderDataTable(head(gram5,5),options = list(dom="t"))

  
  })
