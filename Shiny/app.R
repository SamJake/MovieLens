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
    plotOutput(outputId = "analytics", height = "400px", width = "800px"),
    verbatimTextOutput("out")
    )
    )
)

server <- function(input,output) 
{
  output$out <- renderPrint(input$movie)
  df <- movie_analytics(165)
  mov_plt <- plot_analytics(df,"Little Women")
  output$analytics <- renderPlot(mov_plt)
  
}

shinyApp(ui= ui, server = server)