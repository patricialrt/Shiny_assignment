library(shiny)
library(HistData)
data("Guerry")

shinyUI(pageWithSidebar(
  headerPanel('k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(Guerry)),
    selectInput('ycol', 'Y Variable', names(Guerry),
                selected=names(Guerry)[[5]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    helpText("Guerry is a dataset collecting social data on such things as crime,",
             "literacy and suicide with the view to determining social laws and,",
             "the relations among these variables. It comprises a collection of 'moral",
             "variables' on the 86 departments of France around 1830.",
             "For a description of the Guerry data set please check as well the R help."),
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