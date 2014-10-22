shinyServer(
  function(input, output){
    diabetesRisk <- function(glucosa) glucosa/200
    output$inputValue <- renderPrint({input$glucosa})
    output$prediction <- renderPrint({diabetesRisk(input$glucosa)})
  }
  )