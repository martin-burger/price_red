

library(shiny)
library(datasets)
library(lattice)
library(e1071)
library(ggplot2)


data <- read.csv("training_svm.csv", header = TRUE, sep = ";")

data_test <- read.csv("test_svm.csv", header = TRUE, sep = ";")

fit = svm(LM~ ., data=data, type = "eps-regression")

pred <- predict(fit, data_test)

pred <- data.frame(pred)

pred$woche <- as.numeric(rownames(pred))

title <- paste("Total Sales predicted:", sum(pred$pred))


shinyServer(
  
  function(input, output) {
    
    
      output$plots <- renderPlot({    
      
      data_test$Preis <- data_test$Preis + input$pr 
      
      pred_hist <- pred
      
      pred <- predict(fit, data_test)
      
      pred <- data.frame(pred)
      
      pred$woche <- as.numeric(rownames(pred))
      
      title <- paste("Total Sales predicted:", sum(pred$pred))
      
      p <- ggplot(data = pred, aes(x=woche, y= pred), title = title) + geom_line() + geom_line(aes(x=woche, y= pred), colour="#990000", pred_hist) + ggtitle(title)
        
      print(p)
      
    
      })
      
    })

