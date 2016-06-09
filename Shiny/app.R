#install.packages("shiny")
library("shiny")

ui <- fluidPage(theme = "new2.css",
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
      tabsetPanel(
        tabPanel("Plot",plotOutput(outputId = "plot", height = "400px", width = "800px")),
        tabPanel("Table",tableOutput(outputId = "table"))
      )
    )
    ),
fluidRow(class="footer",
         HTML('<BR><BR><BR><BR><HR>
<footer>
    <aside class="foot-left">
              <span>&copy; 2016 Synechron. All rights reserved.</span> <a href="http://www.synechron.com/contactus#get-in-touch">Contact Us</a>
              </aside>
              </footer>'))
)

server <- function(input,output) 
{
  output$plot <- renderPlot({
    df <- movie_analytics(input$movie)
    p <- plot_analytics(df,"Viewer Watching Behavior")
    print(p)
  })
  output$table <- renderTable({
    df <- movie_analytics(input$movie)
    print(df)
  })
  
}

shinyApp(ui= ui, server = server)