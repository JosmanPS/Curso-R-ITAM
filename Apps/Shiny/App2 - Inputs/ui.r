shinyUI(pageWithSidebar(
  headerPanel("Mostrando Inputs"),
  sidebarPanel(
    numericInput('id1', 'Entrada numérica', 0, min = 0, max = 10, step = 1),
    checkboxGroupInput("id2", "Checkbox", 
                       c("Valor 1" = "1",
                         "Valor 2" = "2",
                         "Valor 3" = "3")),
    dateInput("date", "Fecha:")
    ),
  mainPanel(
    h3('Mostrando outputs'),
    h4('Tu introduciste'),
    verbatimTextOutput("oid1"),
    h4('Tu introduciste'),
    verbatimTextOutput("oid2"),
    h4('Tu introduciste'),
    verbatimTextOutput("odate")
    )
))