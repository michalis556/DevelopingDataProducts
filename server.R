library(shiny)
data(mtcars)

fit<-lm(mpg~am+wt+hp,data=mtcars)


shinyServer(
        
        function(input, output) {
                
                output$prediction <- renderPrint({
                        
                        transmission <- switch(input$var, 
                                               "Automatic" = 0,
                                               "Manual" = 1)
                        output$transm<-renderPrint({input$var})
                        output$horse<-renderPrint({input$horsepower})
                        output$wei<-renderPrint({input$weight})
                        
                        predict(fit,newdata=data.frame(am=transmission,wt=input$weight,hp=input$horsepower))
                })  
               
        }
        )