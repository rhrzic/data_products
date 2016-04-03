
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Where do you fit in?"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3('Hello, friend!'),
      h6('This simple application is the result of the Coursera class on Data products. 
         It aims to offer some perspective on the world population and highlight the incredible
         potential young people have to shape the future of our world.'),
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
      plotOutput("agePlot"),
      h6('Source of data: esa.un.org')
    )
  )
))
