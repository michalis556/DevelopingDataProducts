---
Shiny app Documentation
=========================

This document provides the documentation for the Shiny App in this repository. The app is a prediction of the fuel consumption of a car based on its design. The user inputs the basic characteristics of his/her car:

1. Automatic or Manual
2. Horsepower
3. Weight

The range for the Horsepower is from 50 to 350 and the range for the Weight is from 1000 to 6000 lb.

The application then runs a linear model based on the "mtcars" dataset and returns the value of the Miles per Galon for the specific car of the user. 


Technical Information
=========================

The application is written in Shiny. The ui.R file includes the input required in the Side Panel and the output in the Main Panel. The server.R builds a linear model based on the input. It then provides the values of the input in the model and calculates the specific prediction for these values. 


