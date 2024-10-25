library(shiny)

example <- readLines(here::here("example.md"))

types <- grep("###", example, value = TRUE) |>
  stringr::str_remove_all("### ")

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
    name <- paste0(stringr::str_remove_all(input$plot_type, " "), ".md") |> tolower()
    file <- here::here(glue::glue("pages/{name}"))
    includeMarkdown(file)
  })

  output$plots <- renderImage({
    file <- switch(input$plot_type,
                   `Scatterplot` = "resid-plot-1.png",
                   `Barchart` = "barchart-1.png",
                   `Lineplot` = "lineplot-1.png",
                   `Boxplot` = "boxplot-1.png",
                   `Data diagram` = "diagram-1.png",
                   `Animated visualisation`  = "animation-1.gif")

    list(src = here::here(glue::glue("figures/{file}")),
         width = '100%',
         height = '100%')

  }, deleteFile = FALSE)

}


shinyApp(ui = ui, server = server, options = list(port = 9999))
