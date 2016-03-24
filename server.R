library(shiny)
library(ggplot2)
library(stabledist)

shinyServer(function(input, output) {
  x = seq(-4, 4, length=100)
  stabledistPDFdf <- reactive({
    data.frame(x = x, y = dstable(x, alpha = input$alphaParam,
                                                       beta = input$betaParam,
                                                       gamma = input$gammaParam,
                                                       delta = input$deltaParam)
    )
  })
  
  output$source <- renderDataTable({
    stabledistPDFdf()
  })
  # }, options = list(pageLength = 10))
  
  output$summary <- renderTable({
    summary(stabledistPDFdf())
  })
  
  output$plot <- renderPlot({
    p <- ggplot(stabledistPDFdf(), aes_string(x = stabledistPDFdf()$x, y = stabledistPDFdf()$y)) + geom_line()
    
    print(p)
    
  }, height = 700)
  
})
