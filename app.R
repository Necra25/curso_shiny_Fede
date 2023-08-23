#install.packages("shiny")

#library(shiny)
library("DT")

datos=iris


ui <- fluidPage(
  fluidRow(
    column(12,
           br(h1("Título de la aplicación")),
           align= "center" 
    )
  ),
  hr(),
  fluidRow(
    column(width = 3,
           h2("Título 2 de la col 1"),
           align="center",
           selectInput(
             inputId = "selectSpecie",
             label = "Seleccionar especie:",
             choices = unique(datos$Species),
             selected = "setosa")),
    column(width = 9,
           h2(strong("Título 2 de la col 2")),
           DT::DTOutput("tabla"),
           align="center"),
  )
)

server <- function(input, output, session) {
  output$tabla = DT::renderDataTable({
    
    especieSeleccionada = input$selectSpecie
    
    datos = datos[datos$Species == especieSeleccionada,]
    DT::datatable(datos)
  })
}

shinyApp(ui, server)
