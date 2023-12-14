#ui.R
shinyUI(pageWithSidebar(
  headerPanel("Von Bertalanffy Growth Function"),
  
  sidebarPanel(
    fileInput('datafile', 'Choose data file',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    
    sliderInput("linf", "Linf",
                min = 36.6, max = 74,
                value = 0.5, step = 1),
  
    sliderInput("k", "K",
    min = 0.1, max = 0.208,
    value = 0.1, step = 0.01),
    
    sliderInput("t0", "t",
    min = -4, max = -2,
    value = -4, step = 0.1),
    
    #actionButton("plot", "Plot Curve"),
    
    
    downloadButton(outputId ="downloadPlot", "Save graph")
    
    #radioButtons(inputId = "var3", label = "Select the file type", choices = list("png", "pdf"))
    
  ),
  mainPanel(
    plotOutput("mycurve"),
    plotOutput("plot"),
    plotOutput("curve")
    #tableOutput("table")
  
  )
))

