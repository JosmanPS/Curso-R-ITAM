shinyUI(
  pageWithSidebar(
    # Título
    headerPanel('Predicción de diabetes'),
    sidebarPanel(
      numericInput('glucosa', 'Glucosa mg/dl', 90, min = 50, max = 200, step = 5),
      submitButton('Submit')
      ),
    mainPanel(
      h3('Resultados de la predicción'),
      h4('Tú nivel de glucosa es:'),
      verbatimTextOutput("inputValue"),
      h4('El riesgo de tener diabetes es de:'),
      verbatimTextOutput("prediction")
      )
    )
  )