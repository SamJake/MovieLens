#install.packages("shiny")
library("shiny")

ui <- fluidPage(theme = "new1.css",
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
  <div class="copyright_panel">
      <ul>
        <li>
          <a href="http://www.synechron.com/sitemap" title="">Sitemap</a>
        </li>
        <li>
          <a href="https://cert.webtrust.org/soc3_synechron.html" target="_blank" title="">SOC3</a>
        </li>
        <li>
          <a href="http://www.synechron.com/privacypolicy" title="">Privacy policy</a>
        </li>
        <li>
          &copy; 2016 Synechron.  All Rights Reserved.
        </li>
    </ul>
  </div>
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