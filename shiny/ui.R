# Define UI for application
ui <- fluidPage(shinyjs::useShinyjs(), theme = shinytheme("cerulean"),
                titlePanel(title = h4("The Squirrel Cafe | Predicting Winter Weather Conditions"), windowTitle = "The Squirrel Cafe"),
                sidebarLayout(
                  sidebarPanel(
                    h4(strong("Plotting:")),
                    
                    # Select variable for y-axis 
                    selectInput(inputId = "y", 
                                label = "Y-axis:",
                                choices = c("Month" = "created_month", 
                                            "Nut count" = "nut_count", 
                                            "Nut consumption" = "consumption_speed",
                                            "Temperature (ºC)" = "temperature",
                                            "Temperature (ºF)" = "temperature_converted",
                                            "Time of day" = "created_period",
                                            "Weekday" = "created_weekday"), 
                                selected = "nut_count"),
                    
                    # Select variable for x-axis 
                    selectInput(inputId = "x", 
                                label = "X-axis:",
                                choices = c("Month" = "created_month", 
                                            "Nut count" = "nut_count", 
                                            "Nut consumption" = "consumption_speed",
                                            "Temperature (ºC)" = "temperature",
                                            "Temperature (ºF)" = "temperature_converted",
                                            "Time of day" = "created_period",
                                            "Weekday" = "created_weekday"),
                                selected = "created_month"),
                    
                    # Enter text for plot title
                    textInput(inputId = "plot_title", 
                              label = "Plot title", 
                              placeholder = "Enter text to be used as plot title"),
                    
                    hr(),
                    
                    h4(strong("Subsetting:")),
                    
                    # Select which types of data to plot
                    checkboxGroupInput(inputId = "selected_type",
                                       label = "Select year(s):",
                                       choices = c(2016, 2017, 2018),
                                       selected = c(2016, 2017, 2018)),
                    
                    sliderInput("bins",
                                "Temperature (ºF)",
                                min = min(data$temperature_converted),
                                max = max(data$temperature_converted),
                                value = c(min, max), ticks = T, step = 1, post = 'ºF'),
                    hr(),
                    
                    h4(strong("Options:")),
                    
                    # Show data table
                    checkboxInput(inputId = "show_data",
                                  label = "Show data table",
                                  value = FALSE),
                    hr(),
                    helpText("Last updated: November 14, 2018 by Anna M. Kot")
                  ),
                  
                  mainPanel(
                    tabsetPanel(type = "tabs",
                                id = "tabsetpanel",
                                tabPanel(title = "Plot", 
                                         br(),
                                         plotOutput(outputId = "scatterplot"),
                                         br(),
                                         h5(textOutput("description"))),
                                tabPanel(title = "Data", 
                                         br(), 
                                         DT::dataTableOutput(outputId = "dataTable")),
                                tabPanel(title = "Data Dictionary", 
                                         br(), 
                                         dataTableOutput(outputId = "dataDict")),
                                tabPanel(title = "ReadMe",
                                         htmlOutput(outputId = 'readme'))
                    )
                  )
                ))
