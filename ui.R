
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Home Loan Calculator"),
  
  sidebarLayout(
    
    sidebarPanel(
      #sliderInput("homeprice", "Home Price", min=10000, max=1000000, value=20000, step=100),
      textInput("homeprice", "Home Price", value=100000),
      #sliderInput("downpayment", "Down Payment", min=0, max=100000, value=0, step=100),
      textInput("downpayment", "Down Payment", value=10000),
      sliderInput("irate", "Interest Rate", min=2.00, max=10.00, value=3.25, step=0.05),
      sliderInput("loanyear", "Years of Loan", min=5, max=40, value=10, step=1)
      #sliderInput("principal", "Principal", min=100, max=10000, value=500, step=100)
    ), #sidebarPanel ends
    mainPanel(h1("Your monthly payment:"), h3("RM",textOutput("resultPayment")),
              plotOutput("resultPie"),
              h1("Payments Table"), dataTableOutput("resultTable"))
  ) #sidebarLayout ends
)) #fluidPage ends)
