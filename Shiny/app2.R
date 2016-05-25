#install.packages("shiny")
library(shiny)

ui <- fluidPage(
  titlePanel(title = h1("MovieLens Analytics", align="center")),
             br(),
             br(),
             br(),
             br(),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "cat", label = "Select a movie genre", choices =  names(mov2)[5:22], selected = "None", width = "400px")
    ),
    mainPanel(
      tableOutput(outputId = "top10")
    )
  )
)



server <- function(input,output)
{
  h1("Top 10 Movies")
  output$top10 <- renderTable({
    t <- top10(input$cat)
    print(t)
  })
  
}


shinyApp(ui = ui, server = server)