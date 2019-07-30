#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# Wine data info: https://rdrr.io/cran/rattle.data/man/wine.html


library(shiny)
library(rattle)
data(wine)
vchoices <- 2:ncol(wine)
names(vchoices) <- names(wine[,2:ncol(wine)])
# Define UI for application that selects a column out of the wine data set
# Uses that selected column to do a Y by x scatter plot with box plot where
# y is 'Type' column and X is the selected column
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wine type prediction grapher"),
  
  # Sidebar with a slider input for column selection
  sidebarLayout(sidebarPanel(
        helpText("This application uses the built in data set 'wine' in the 
                rattle package. 
                https://rdrr.io/cran/rattle.data/man/wine.html
                Source code at https://github.com/arairkar/ddp/
                
                It lets you select a predictor X that describes 
                a characteristic of wine and graphical representation of how 
                wine 'type' relates to that predictor. Ultimately, the best 
                predictors can be used to build a multivariate nominal logistic 
                regression model per user choice"),
            
        selectInput( "Xcolumn", 
                label = " Select a predictor XColumn",
                        choices = vchoices
            )
            
    ),
    
    # Show a plot of selected X-Column Vs 'Type' column and displays subset data
    mainPanel(
            textOutput("ColName"),
            plotOutput("distPlot"),
            dataTableOutput("Table")
           
       
    )
  )))
