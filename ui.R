library(shiny)
library(HistData)
data("Galton")

shinyUI(pageWithSidebar(
  headerPanel('Galton k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(Galton)),
    selectInput('ycol', 'Y Variable', names(Galton),
                selected=names(Galton)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    helpText("For a description of the Guerry data set please",
             "type into your R Console ?Guerry."),
    helpText("k-means clustering aims to partition n observations",
             "into k clusters in which each observation belongs to",
             "the cluster with the nearest mean, serving as a prototype",
             "of the cluster. For more information on k-means, here's some",
             "first reading: https://en.wikipedia.org/wiki/K-means_clustering")
  ),
  mainPanel(
    plotOutput('plot1')
  )
)
)