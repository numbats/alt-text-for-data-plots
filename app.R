library(shiny)

types <- c("Scatterplot", "Barplot", "Lineplot", "Boxplot", "Diagram", "Animation")

ui <- fillPage(

  navbarPage("Alt Text for Data Plots",

             tags$style(HTML("#top {height: 80vh; overflow-y: scroll;")),

             tabPanel("Introduction",

                      fluidRow(id = "top",

                               column(7,

                                      includeMarkdown("pages/introduction.md")

                               )

                      )

                      ),

             tabPanel("Example",

                      fluidRow(id = "top",

                               column(7,

                                      selectInput(
                                        inputId = "plot_type",
                                        label = "Plot type",
                                        choices = types
                                      ),

                                      uiOutput("example")

                                      ),

                               column(5,

                                      imageOutput("plots", width = "100%", height = "100%")

                                      )

                               )

                      )

             )

)



# server ------------------------------------------------------------------

server <- function(input, output) {

  output$example <- renderUI({
    file <- switch(input$plot_type,
                   Scatterplot = "pages/scatterplot.md",
                   Barplot = "pages/barplot.md",
                   Lineplot = "pages/lineplot.md",
                   Boxplot = "pages/boxplot.md",
                   Diagram = "pages/diagram.md",
                   Animation = "pages/animation.md"
                   )
    includeMarkdown(file)
  })

  output$plots <- renderImage({
    file <- switch(input$plot_type,
                   Scatterplot = "scatterplot.png",
                   Barplot = "barplot.png",
                   Lineplot = "lineplot.png",
                   Boxplot = "boxplot.png",
                   Diagram = "diagram.png",
                   Animation = "animation.gif")

    list(src = here::here(glue::glue("figures/{file}")),
         width = '100%',
         height = '100%')

  }, deleteFile = FALSE)

}


shinyApp(ui = ui, server = server, options = list(port = 9999))
