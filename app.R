#install.packages("shiny")
library("shiny")
ui <- fluidPage(
  {
    headerPanel('MovieLens Analytics')
    sidebarPanel(
    selectInput(inputId = 'movie',
                label = 'Select movie to analyize watching patterns', 
                choices = mov2$MovieID)
    )
    mainPanel(
    plotOutput(outputId = 'analytics', height = '400px')
    )
  }
)

server <- function(input,output) 
{
  df <- reactive({movie_analytics(input$movie)})
  data <- reactive({plot_analytics(df(),"Toy story")})
  output$analytics <- renderPlot({data})
}

shinyApp(ui= ui, server = server)