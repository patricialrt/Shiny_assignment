library(shiny)
library(HistData)
data("Galton")

shinyUI(pageWithSidebar(
  headerPanel('k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(Galton)),
    selectInput('ycol', 'Y Variable', names(Galton),
                selected=names(Galton)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    helpText("The Galton-datasets contains social data on such things as crime,",
             "literacy and suicide with the view to determining social laws and,",
             "the relations among these variables. It comprises a collection of 'moral",
             "variables' on the 86 departments of France around 1830.",
             "For a description of the Galton-dataset please check as well the R help."),
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