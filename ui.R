library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel("Stable Distribution Explorer"),
  
  sidebarPanel(
    sliderInput(
      'alphaParam', 'Index parameter alpha', min = 0.01, max = 2,
      value = 1, step = 0.01, round = FALSE
    ),
    
    sliderInput(
      'betaParam', 'Skewness parameter beta', min = -0.99, max = 0.99,
      value = 0, step = 0.01, round = FALSE
    ),
    
    sliderInput(
      'gammaParam', 'Scale parameter gamma', min = 0.01, max = 100,
      value = 1, step = 1, round = 0
    ),
    
    sliderInput(
      'deltaParam', 'Location (or Shift) parameter delta', min = -100, max = 100,
      value = 0, step = 1, round = 0
    )
  ),

  mainPanel(
    tabsetPanel(id = "tabset",
      tabPanel("Data",
               br(),
               dataTableOutput('source')
      ),
      tabPanel("Summary",
               br(),
               tableOutput('summary')
      ),
      tabPanel("Plot",
               plotOutput('plot')
      )
    )
  )
))
