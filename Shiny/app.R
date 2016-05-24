#install.packages("shiny")
library("shiny")

ui <- fluidPage(
    titlePanel("MovieLens Analytics"),
    sidebarLayout(
    sidebarPanel(
    selectInput(inputId = "movie",
                label = "Select movie to analyize consumer behaviour", 
                choices = mov2$MovieID)
    ),
    mainPanel(
    plotOutput(outputId = "analytics", height = "400px")
    )
    )
)

server <- function(input,output) 
{
  #df <- reactive({movie_analytics(input$movie)})
  #data <- reactive({plot_analytics(df,"Toy story")})
  #output$analytics <- renderPlot({data})
  
  df <- movie_analytics(261)
  data <- plot_analytics(df,"Little Women")
  output$analytics <- renderPlot(data)
}

shinyApp(ui= ui, server = server)