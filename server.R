#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rattle)
library(ggplot2)
data(wine)

# Comments
shinyServer(function(input, output) {
        
        selcol <- reactive({as.numeric(input$Xcolumn)})
        
        output$ColName <- renderText(paste("Selected X Column:",
                colnames(wine)[selcol()]))
        mydf <- reactive({
                df <- cbind(wine$Type,wine[,selcol()])
                colnames(df) <- c("Type",colnames(wine)[selcol()])
                return(df)})
      
        output$Table <- renderDataTable({
                mydf()
                })
       output$distPlot <- renderPlot({
             ggplot(wine,aes(y=wine[,selcol()],x=Type,color=Type)) + 
                geom_point() + geom_boxplot(size = 1) + geom_jitter() + 
                coord_flip() + ylab(colnames(wine)[selcol()]) + xlab("Type")
                       
       })
 })
