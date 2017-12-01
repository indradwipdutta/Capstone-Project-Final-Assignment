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

server <- shinyServer(function(input, output,session) {
 
  
  Inputwords<-reactive({
    
              predFn(input$user.Input)
              #predFn(userText())
              })
 
  

   observe({  
     
     if(input$user.Input !=""){  
     
  output$Pred.Output<- renderDataTable(data.frame(suggested=Inputwords()),options = list(pageLength = 4))
  
  
  output$pred.word1<-renderText(strsplit(head(as.character(Inputwords()$Words))[1]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])])
  output$pred.word2<-renderText(strsplit(head(as.character(Inputwords()$Words))[2]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[2])])
  output$pred.word3<-renderText(strsplit(head(as.character(Inputwords()$Words))[3]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[3])])
  output$pred.word4<-renderText(strsplit(head(as.character(Inputwords()$Words))[4]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[4])])
  output$pred.word5<-renderText(strsplit(head(as.character(Inputwords()$Words))[5]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[5])])
  output$pred.word6<-renderText(strsplit(head(as.character(Inputwords()$Words))[6]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[6])])
   }
  else
  {
    updateTextInput(session,"user.Input",value="type in something at least")}
    })
  
  
  
  output$Gram1.summary<-renderText(length(gram1$Words))
  output$Gram2.summary<-renderText(length(gram2$Words))
  output$Gram3.summary<-renderText(length(gram3$Words))
  output$Gram4.summary<-renderText(length(gram4$Words))
  output$Gram5.summary<-renderText(length(gram5$Words))
 
  
   
   observeEvent(input$sel.pred.word1,
                
                {
                  splitWord<-strsplit(head(as.character(Inputwords()$Words))[1]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])]
                  updateTextInput(session,"user.Input",value=paste(input$user.Input,splitWord))
                }) 
   
   
   observeEvent(input$sel.pred.word2,
                
                {
                  splitWord<-strsplit(head(as.character(Inputwords()$Words))[2]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])]
                  updateTextInput(session,"user.Input",value=paste(input$user.Input,splitWord))
                })  
   
  
   
   observeEvent(input$sel.pred.word3,
                
                {
                  splitWord<-strsplit(head(as.character(Inputwords()$Words))[3]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])]
                  updateTextInput(session,"user.Input",value=paste(input$user.Input,splitWord))
                })  
   
   
   
   observeEvent(input$sel.pred.word4,
                
                {
                  splitWord<-strsplit(head(as.character(Inputwords()$Words))[4]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])]
                  updateTextInput(session,"user.Input",value=paste(input$user.Input,splitWord))
                }) 
   
   
   
   
   observeEvent(input$sel.pred.word5,
                
                {
                  splitWord<-strsplit(head(as.character(Inputwords()$Words))[5]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])]
                  updateTextInput(session,"user.Input",value=paste(input$user.Input,splitWord))
                }) 
   
   
   
   
   observeEvent(input$sel.pred.word6,
                
                {
                  splitWord<-strsplit(head(as.character(Inputwords()$Words))[6]," ")[[1]][word_count(head(as.character(Inputwords()$Words))[1])]
                  updateTextInput(session,"user.Input",value=paste(input$user.Input,splitWord))
                }) 
   
   
  output$Gram1<- renderDataTable(head(gram1,10),options = list(dom="t"))
  output$Gram2<- renderDataTable(head(gram2,9),options = list(dom="t"))
  output$Gram3<- renderDataTable(head(gram3,8),options = list(dom="t"))
  output$Gram4<- renderDataTable(head(gram4,10),options = list(dom="t"))
  output$Gram5<- renderDataTable(head(gram5,9),options = list(dom="t"))

  
  
  })

#shinyApp(ui = ui, server = server)



