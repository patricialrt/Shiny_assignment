library(shiny)
library(HistData)
Guerry1 <- Guerry

shinyUI(pageWithSidebar(
  headerPanel('Guerry k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(Guerry1)),
    selectInput('ycol', 'Y Variable', names(Guerry1),
                selected=names(Guerry)[[5]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    helpText("For a description of the Guerry data set please",
             "type into your R Console ?Guerry."),
    helpText("For more information on k-means, here's some first reading:",
             "https://en.wikipedia.org/wiki/K-means_clustering")
  ),
  mainPanel(
    plotOutput('plot1')
  )
)
)