#install.packages("shiny")
library("shiny")

ui <- fluidPage(
    titlePanel(title = h1("MovieLens Analytics", align="center")),
    br(),
    br(),
    br(),
    br(),
    sidebarLayout(
    sidebarPanel(
    selectInput(inputId = "movie",
                label = "Select movie to analyize consumer behaviour", 
                choices = setNames(mov2$MovieID,mov2$Title))
      
    ),
    mainPanel(
    plotOutput(outputId = "analytics", height = "400px", width = "800px")
    )
    )
)

server <- function(input,output) 
{
  output$analytics <- renderPlot({
    df <- movie_analytics(input$movie)
    p <- plot_analytics(df,"Viewer Watching Behavior")
    print(p)
  })
  
}

shinyApp(ui= ui, server = server)