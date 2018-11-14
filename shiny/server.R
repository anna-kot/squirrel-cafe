server <- function(input, output, session) {
  
  #Create a subset of data filtering for selected title types
  data_selected <- reactive({
    req(input$selected_type)
    filter(data, 
           created_year %in% input$selected_type,
           temperature_converted >= input$bins[1],
           temperature_converted <= input$bins[2])
  })
  
  # x and y as reactive expressions
  x <- reactive({ toTitleCase(str_replace_all(input$x, "_", " ")) })
  y <- reactive({ toTitleCase(str_replace_all(input$y, "_", " ")) })
  
  # Create scatterplot object the plotOutput function is expecting 
  output$scatterplot <- renderPlot({
    ggplot(data = data_selected(), aes_string(x = input$x, y = input$y)) +
      geom_point() +
      labs(x = x(),
           y = y(),
           color = toTitleCase(str_replace_all(input$z, "_", " ")),
           title = toTitleCase(input$plot_title))
  })
  
  # Create description of plot
  output$description <- renderText({
    paste("The plot above shows the relationship between",
          x(),
          "and",
          y(),
          "for",
          nrow(data_selected()),
          "data points.")
  })
  
  # Print data table if checked
  output$dataTable <- DT::renderDataTable(
    DT::datatable(data = data_selected(), 
                  options = list(pageLength = 10, lengthMenu = c(10, 25, 50,100)), 
                  rownames = FALSE)
  )
  
  # Display data table tab only if show_data is checked
  observeEvent(input$show_data, {
    if(input$show_data){
      showTab(inputId = "tabsetpanel", target = "Data", select = TRUE)
    } else {
      hideTab(inputId = "tabsetpanel", target = "Data")
    }
  })
  
  output$dataDict <- renderDataTable({
    datatable(data = dataDict, options = list(pageLength = 10, lengthMenu = c(10, 25, 50)), rownames = FALSE)
  })
  
  output$readme <- renderText({
    HTML(html_text)
  })
}