#server.R
library(shiny)
library(ggplot2)
wd <- getwd()
setwd(wd)

xx<-data.frame(t=seq(0.5, 74))

linf <- 36.5
k <- 0.1
t0 <- -4

shinyServer(function(input, output, session) {
  
 
  dataframe <- function()({
    if(is.null(input$datafile))
      return(NULL)
    data <-read.csv(input$datafile$datapath)
   
  })
  
  output$plot <- renderPlot({
    if(!is.null(dataframe()))
      ggplot(dataframe(),aes(x= Age, y= Length))+geom_line()
    
  }) 
  
  output$downloadPlot <- downloadHandler(
    filename = "Shinyplot.png",
    content = function(file) {
      png(file)
      print(ggplot(dataframe(),aes(x = Age, y = Length, colour ="Growth Curve")) + geom_line())
      dev.off()
      
    })
  
  
  output$mycurve <-renderPlot({
    t <- xx[,1]
    lt <- input$linf * (1- exp((-input$k) * (t-(input$t0))))   
    #lt <- linf * (1- exp(-k) * (t-(t0)))
    qplot(t,lt, xlab  = "Age", ylab = "Length") + geom_line()
    #plot(, t, ltxlab = , ylab ="Length", main = "Yellow fin tun Growth",
       #pch = 19)
    
    
    })
  
      
})
  
    
  