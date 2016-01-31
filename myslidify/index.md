---
title       : Guerry k-means clustering
subtitle    : 
author      : Patricalrt
job         : Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

##Slide2
Assignment for Developing Data Products
Your Shiny Application:
Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
-Deploy the application on Rstudio's shiny server
-Share the application link by pasting it into the provided text box
-Share your server.R and ui.R code on github

The application must include the following:
-Some form of input (widget: textbox, radio button, checkbox, ...)
-Some operation on the ui input in sever.R
-Some reactive output displayed as a result of server calculations
-You must also include enough documentation so that a novice user could use your application.

To fulfill this assignment I modified the kmeans example to a different dataset. I chose the Guerry dataset as I live at the moment in France :) I found it interesting to visualize social data.

--- .class #id 

##Slide3
```r{
#ui.R
library(shiny)
library(HistData)
data(Guerry)
shinyUI(pageWithSidebar(
  headerPanel('Guerry k-means clustering'),
  sidebarPanel(
    data(Guerry),
    selectInput('xcol', 'X Variable', names(Guerry)),
    selectInput('ycol', 'Y Variable', names(Guerry),
                selected=names(Guerry)[[5]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    helpText("For a description of the Guerry data set please",
             "type into your R Console ?Guerry."),
    helpText("For more information on k-means, here's some first reading:",
             "https://en.wikipedia.org/wiki/K-means_clustering")),
  mainPanel(plotOutput('plot1'))))
}

--- .class #id 

##Slide4
```r{
#server.R
library(shiny)
library(HistData)
data(Guerry)
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
shinyServer(function(input, output, session) {
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    data(Guerry)
    Guerry[, c(input$xcol, input$ycol)]})
  clusters <- reactive({
   kmeans(selectedData(), input$clusters)})
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })})
}

--- .class #id 

##Slide5

links: 
https://github.com/patricialrt/Shiny_assignment
http://shiny.rstudio.com/gallery/kmeans-example.html
