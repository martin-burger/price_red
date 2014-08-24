

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Price-Reduction"),
  sidebarPanel(
    sliderInput("pr", "Price-Reduction",  min = 0,
                max = 1, 
                value = 0)
  ),
  mainPanel(
    h5("
This application uses historical data about sales to learn a SVM-Modell. The historical 
data consists of variables representing price, saisonality and historical sales. Then, this
modell is used to predict a future period of time. The slider in this application influences
the price input for the future time period, which means, it is possible to simulate different
price situations. To keep this app simple, the percentage of price reduction is the same over
the whole predicted period. In the plot you can see the influence over the weeks, plotting
the original sales development and the predicted sales development"),
    plotOutput("plots")
  )
))