
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("How old are you in the world?"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("age",
                  "How old are you?",
                  min = 1,
                  max = 110,
                  value = 30,
                  round=TRUE),
      
      textOutput("older")
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("agePlot")
    )
  )
))
