Regression Models Assignment 
========================================================
Executive Summary
========================================================
This research focuses on the problem of investigating the relationship between variables and the Miles per Gallon (MPG) consumption. More specifically, we are going to examine the following subjects:

"Is automatic or manual transmission better for MPG?"

"What is the difference between automatic and manual transmission for MPG?"

To examine these topics we are going to use the "mtcars" data set. The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).  


Exploratory Analysis
=====================================================
The "mtcars" data set has observations for 32 cars for 11 different variables. We are interested in the relationship of  MPG with the rest of the 10 variables. These variables are:

Number of cylinders, Displacement, Gross Horsepower, Rear axle Ratio, Weight, 1/4 mile time, V/S, Transmission (automatic or manual), Number of forward gears and Number of carburetors.

We are going to draw plots of each variable against the MPG to get a view of their relationship. These plots will give us some insight on the model that we can use to quantify the MPG with respect to the rest of the variables. An example of the relationship of MPG with Gross Horsepower is given in the Appendix. We ommit more graphs because of the lack of space.

Some of the variables may be corellated. We do not want to add variables with too high corellation since this is reduntand. We find the variables which have corellation greater than 0.7 and use only one of them in our investigation for a model. We found that MPG is highly corellated with cylinders, horsepower, weight and displacement. But also cylinders are highly corellated with horsepower and displacement and weight with cylinders and displacement. For this reason when we investigate for the best model we are going to keep these relations in mind. The code for finding highly corellated variables is ommited.   

We are interested specifically for the relationship of MPG with automatic and manual transmission. We will explore this relationship through a couple of plots. A histogram of the milage per gallon for automatic and manual transmission is given in the Appendix. Observe that the manual transmission seems to have better performance. We can also see that by calculating the mean milage per gallon for each of the two variables.


The mean MPG for automatic transmission is 17.1474 and the mean MPG for manual transmission is 24.3923.

Regression Model
=====================================================
We are interested in the relationship of automatic and manual transmission with the MPG. To find this we can fit a model with transmission as the only variable. This model will be a weak predictor though of the MPG. Therefore we are first going to find a good model for the MPG with respect to the more appropriate variables and then explore the relationship we are interested in. 

For the purposes of this study we are going to use multivariate regression analysis. We are going to first start with a model with a single variable as a predictor. Then we are going to add variables to make our model better. Since we are specifically interested in the automatic vs manual transmission our first model will be with these as predictors


```r
data(mtcars)
mtcars$am <- as.factor(mtcars$am)
fit1 <- lm(mpg ~ am - 1, data = mtcars)
```

The model has a very high R squared (0.94) which means it is a good fit. The coefficients of automatic and manual transmission are 17.1474 and 24.3923 respectively. This means that if the transmission is automatic the expected milage per gallon is 17.1474 and if it is manual this is 24.3923. These coefficients are a good fit since they have a p-value of 1.134 &times; 10<sup>-15</sup> and 1.3763 &times; 10<sup>-17</sup> respectively. This means for the automatic transmission for example that the probability of the coefficient estimate to be wrong is 1.134 &times; 10<sup>-15</sup>. 

Although the R squared value is high we can see from the plots of the residuals that our model is not a good fit. Also the sum of the residuals squared is too high (720.8966). The residual plots are ommited for this case but we found out that we need to add more variables to our model. We are going to add one variable each time and check whether the fit is good or not. An example of adding one variable is given below. 


```r
mtcars$am <- as.factor(mtcars$am)
fit2 <- update(fit1, mpg ~ am + wt - 1)
anova1 <- anova(fit1, fit2)
```


The p-value for the anova is 1.8674 &times; 10<sup>-7</sup>, which means that adding the new variable for the weight is correct. We have also added the horsepower variable.  



The p-value for the anova is 2.85 &times; 10<sup>-5</sup>, which means that adding the new variable for the horsepower is correct. The residual sum of squares is 
147.3137. Our final model is 




MPG =  58.9957am0 + 60.7522am1  -2.4681wt -6.4888log(hp).

This means that if the car has automatic transmission keeping all other variables constant the MPG is 58.9957. If the car has manual transmission then this is 60.7522. Increasing he weight of a car by 1000 lb keeping all other things constant reduces the MPG by -2.4681. Finally increasing he horsepower by 10 and keeping all other variables constant reduces the MPG by -6.4888.

The coefficients of the variables of our model seem to all be significant. The p-values for automatic, manual transmission, weight and horsepower are 1.3579 &times; 10<sup>-12</sup>, 8.6348 &times; 10<sup>-13</sup>, 0.0056 and 2.85 &times; 10<sup>-5</sup> respectively, which are all less than the acceptance level of 0.01. 

Answers to our Questions
========================================================================
For the initial plots of our exploratory analysis we could spot that the automatic and manual transmission have different effect on the MPG. We observed that they had a significant difference in the mean MPG with automatic transmission having a mean of 17.1474 and manual transmission having a mean of 24.3923. To conclude it appears that the manual transmission has a higher MPG consumption than the automatic transmission. This difference though it is not completelely justified if we use our regression model since their confidence intervals overlap significantly. 


```r
Coef <- summary(fit3)$coefficients
```

The 95% confidence interval for the automatic transmission is [48.9645, 69.0268] and for the manual transmission this is [50.6179, 70.8865]. 

Our regression model also shows  how much this difference is. If we want to quantify the difference we can observe that with automatic transmission keeping all other variables constant the effect on the MPG is 58.9957 and if the car has manual transmission then this is 60.7522.  


Appendix
=====================================================================================================
A graph Plot of Horsepower against MPG

```r
data(mtcars)

library(ggplot2)

m <- ggplot(mtcars, aes(hp, mpg))
m + geom_point()
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


A histogram showing automatic and manual transmission against MPG

```r
data(mtcars)

library(ggplot2)
mtcars$am <- as.factor(mtcars$am)
m <- ggplot(mtcars, aes(x = mpg))
m + geom_histogram(aes(fill = am))
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 



Residual Plots for our final model

```r
par(mfcol = c(2, 2))
plot(fit3)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

