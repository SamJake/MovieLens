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
              <span>&copy; All Rights Reserved.</span> <a href="mailto:EAG-Support@synechron.com">Contact Us</a>
              </aside>
              <aside class="foot-right">
              <a href="https://twitter.com/synechroninc" title="Twitter" target="_blank"  class="twitter">&nbsp;</a>
              <a href="http://www.youtube.com/user/SynechronInc" title="Youtube" target="_blank" class="youtube">&nbsp;</a>
              <a href="https://www.facebook.com/synechrontechnologies" title="Facebook" target="_blank"  class="facebook">&nbsp;</a>
              <a href="http://www.linkedin.com/company/synechron" title="Linkedin" target="_blank" class="in">&nbsp;</a>
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