library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Predicting Fuel Consumption based on Car's Design"),
        
        
                sidebarPanel(
        
                        helpText("Choose the appropriate values"),
                        selectInput('var', 
                                    label = "Automatic or Manual",
                                    choices =  c("Automatic", "Manual"),
                                    selected="Manual"),
                        
                        numericInput('horsepower',label = "Horsepower",145,min=50,max=350,step=5),
                        
                        numericInput('weight',label ="Weight (1000lb)",3,min=1,max=6,step=0.2),
                        
                        submitButton('Submit')
                        
                        ),
        
                
                mainPanel(
                        
                        h3('Results of the prediction'),
                        
                        h3('Your car is'),
                        
                        verbatimTextOutput("transm"),
                        
                        h3('with a total horsepower of'),
                        
                        verbatimTextOutput("horse"),
                        
                        h3('and weights (1000 lb)'),
                        
                        verbatimTextOutput("wei"),
                        
                        h3('The Milage per Galon of your car is:'),
                        
                        verbatimTextOutput("prediction")
                        
                        )
        
        
        ))

