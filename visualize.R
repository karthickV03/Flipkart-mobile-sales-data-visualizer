# Load required libraries
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

# Read the CSV file
data <- read.csv(file.choose())

# Extract unique brand names
brands <- unique(data$brand)
# Extract unique metrics for y-axis
metrics <- c("avg_rating", "ratings_count", "reviews_count", "one_stars_count", "two_stars_count", "three_stars_count", "four_stars_count", "five_stars_count")

# Define UI
ui <- fluidPage(
  titlePanel("Mobile Phone Metrics by Brand"),
  sidebarLayout(
    sidebarPanel(
      # Add select input for brand with choices
      selectInput("brand", "Select Brand", choices = brands),
      hr(),
      # Add select input for y-axis attribute with choices
      selectInput("y_axis", "Select Y-Axis Attribute", choices = metrics),
      hr(),
      p("Select a brand and a y-axis attribute from the dropdown menus to visualize the mobile phone metrics."),
      p("If no data is available for the selected brand, a message will be displayed.")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Plotting function
  output$plot <- renderPlot({
    # Filter data based on selected brand
    filtered_data <- data %>%
      filter(brand == input$brand)
    
    # Plot only if there's data for the selected brand
    if (nrow(filtered_data) > 0) {
      # Melt the data frame to long format for ggplot
      melted_data <- filtered_data %>%
        select(title, all_of(input$y_axis)) %>%
        pivot_longer(cols = -title, names_to = "metric", values_to = "value")
      
      # Create bar plot of metrics for each title
      ggplot(melted_data, aes(x = title, y = value, fill = metric)) +
        geom_bar(stat = "identity", position = "stack") +
        labs(title = paste("Mobile Phone Metrics for", input$brand),
             x = "Title",
             y = input$y_axis) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability
    } else {
      # If no data for selected brand, show a message
      plot(NULL, xlim = c(0, 1), ylim = c(0, 1), 
           main = "No data available for selected brand")
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)
