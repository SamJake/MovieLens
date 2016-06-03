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
      tabsetPanel(
        tabPanel("Plot",plotOutput(outputId = "plot", height = "400px", width = "800px")),
        tabPanel("Table",tableOutput(outputId = "table"))
      )
    )
    ),
fluidRow(class="footer",
         HTML('<BR><BR><BR><BR><HR>
              <P align="center"><B>DIGITAL / BUSINESS CONSULTING / TECHNOLOGY      
              <a href="http://www.synechron.com/sitemap">SITEMAP</a>     
                <a href="https://cert.webtrust.org/soc3_synechron.html">SOC3</a>     
                <a href="http://www.synechron.com/privacypolicy">PRIVACY POLICY</a>      
                2016 SYNECHRON. ALL RIGHTS RESERVED.</B></P>'))
    
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