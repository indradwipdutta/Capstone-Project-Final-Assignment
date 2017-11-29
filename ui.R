#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(
  

  # Application title
  titlePanel(h1("Predict the Next word to type in",
                style="color:white;background-color:lightblue;font-style:italic")),
  h4("Coursera Capstone Assignment Week7-Part1,Data Product:Shiny Application  |  Author:Indradwip Dutta",
     style="color:steelblue;font-style:italic"),
    # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(

       h3('Input Your text in the text input alongside',style="color:steelblue"),

      h4("your precited texts should show below in the order of highest 
         probablity of occurence",style="color:steelblue")
         
          
         
       
     
    ),
    
    # Show a plot of the generated distribution
    mainPanel(

      tabsetPanel(type="tabs",

             ##steelblue 
             ##dodgerblue
             
             
                 tabPanel("Predict.Text",
                      
                      h5(span(textInput("user.Input","type in","text type here")),style="color:steelblue;background-color:biege"),
                      h5(dataTableOutput("Pred.Output"),style="color:steelblue") ),
                      
                    
                    tabPanel("Background",h5("the Gram Tables are shown in alongside Tabs",style="color:white;background-color:lightblue")),
                    #h4(dataTableOutput("Gram2"),style="color:steelblue")
             
             
                    tabPanel("Unigram.BiGram",h5("Unigram",dataTableOutput('Gram1'),style="color:steelblue"),
                             h5("biGram",dataTableOutput('Gram2'),style="color:steelblue")),
                        #h4(dataTableOutput("Gram2"),style="color:steelblue")
      
      
                    tabPanel("Tri.Tetra.Penta.Gram",h5("Trigram",dataTableOutput('Gram3'),style="color:steelblue"),
                        h5("TetraGram",dataTableOutput('Gram4'),style="color:steelblue")),
                        
                        
                      tabPanel("Penta.Gram",h5("PentaGram",dataTableOutput('Gram5'),style="color:steelblue"),
                               #font-style:bold;font-style:italic;              
  h5(style="display: inline-block;vertical-align:top;background-color:lightblue",textOutput("pred.word1")),
  h5(style="display: inline-block;vertical-align:top;background-color:lightblue",textOutput("pred.word2")),
  h5(style="display: inline-block;vertical-align:top;background-color:lightblue",textOutput("pred.word3")),
  h5(style="display: inline-block;vertical-align:top;background-color:lightblue",textOutput("pred.word4")),
  h5(style="display: inline-block;vertical-align:top;background-color:lightblue",textOutput("pred.word5")),
  h5(style="display: inline-block;vertical-align:top;background-color:lightblue",textOutput("pred.word6")),
  h5(span(textInput("user.Input.test","type in","text type here")),style="color:steelblue"),
  actionButton("testButton","testButton")
                      )    
                        
                        
                                
                )                
            )
      )
  )
  
)
