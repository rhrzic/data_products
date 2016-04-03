#
#This is a simple little application for the Data Products Coursera course
#
#It is quite simple to use - you just use the slider to set your age. The application then uses UN's
#age data to calculate the percentage of people worldwide you're older than and displays your position
#on the age histogram.
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
## Here we create the worldwide age dataset
  
  agefreq <- c(670928, 637449, 607431,590069,603509,609793,551085,497756,485058,454043,401753,339691,292727,215047,153207,114652,71450,37062,13389,2922,451)
  agegroups <- factor(1:21, labels=c("0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79","80-84","85-89","90-94","95-100", "100+"))
  agedata <- data.frame(agegroup=agegroups, agefreq=agefreq*1000)
  
## This section calculates the percentage of the world's population the age selected is higher than  
  
  output$older <- renderText({
    ageselected <- ceiling(input$age/5 + 0.1)
    paste("You are older than",round(sum(agedata[[2]][1:ageselected])*100/sum(agedata[[2]]), 2), "% of the world's population!")
  })
  
## This section creates the age histogram and plots a vertical line of the selected line  
  
  output$agePlot <- renderPlot({
    ageselected <- ceiling(input$age/5 + 0.1)
    g=ggplot(agedata,aes(x=agegroup,y=agefreq))
    g=g+geom_bar(stat = "identity", aes(fill=agegroup))
    g=g+scale_fill_grey(start = 0.2, end = 0.8) 
    g=g+geom_vline(xintercept = ageselected,colour="orange")
    g=g+labs(title ="World Age Histogram", x = "Age Group", y = "Number of People") 
    g=g+ theme(legend.position="none")
    g
    
  })

})
