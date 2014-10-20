shinyUI(pageWithSidebar(
  headerPanel("Ilustrando Markup"),
  sidebarPanel(
    h1('Panel lateral'),
    h1('H1 texto'),
    h2('H2 texto'),
    h3('H3 texto'),
    h4('H4 texto')
    
    ),
  mainPanel(
    h3('Texto del panel principal'),
    code('Escribimos algún código'),
    p('Texto ordinario')
    
    )
  
))