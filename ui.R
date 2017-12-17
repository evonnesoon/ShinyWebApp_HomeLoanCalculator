setwd("/Users/soonevonne/Desktop/UM/1Semester/Principles of DtSc/2Assignment/3_GroupProject/ShinyApp_asgn/HomeLoanCalculator/")
library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    titlePanel("Home Loan Calculator"),
    
    sidebarLayout(
      
      sidebarPanel(
        #sliderInput("homeprice", "Home Price", min=10000, max=1000000, value=20000, step=100),
        textInput("homeprice", "Home Price", value=100000),
        #sliderInput("downpayment", "Down Payment", min=0, max=100000, value=0, step=100),
        textInput("downpayment", "Down Payment", value=10000),
        sliderInput("irate", "Interest Rate", min=2.00, max=10.00, value=3.25, step=0.05),
        sliderInput("loanyear", "Loan Period", min=5, max=40, value=20, step=1)
        #sliderInput("principal", "Principal", min=100, max=10000, value=500, step=100)
      ), #sidebarPanel ends
      mainPanel(
        tabsetPanel(
          tabPanel("Summary",
                   h2(p("WQD7001 Principles of Data Science : Group Assignment"), align="center"),
                   h1(strong("Home Loan Calculator"),align="center", style = "font-family: 'times'; font-si20pt"),
                   
                   h2("Group members:"),
                   p("1. LEE YONG TAI (", span(em("WQD170055"), style="color:blue"), ")", style="font-family: 'times'; font-size: 13pt"),
                   p("2. VOON ZHI LING (", span(em("WQD170056"), style="color:blue"), ")", style="font-family: 'times'; font-size: 13pt"),
                   p("3. SOON EVONNE (", span(em("WQD170057"), style="color:blue"), ")", style="font-family: 'times'; font-size: 13pt"),
                   
                   h2("Date:"),
                   p("10th December 2017", style="font-family: 'times'; font-size: 15pt"),
                   
                   h2("Objective:"),
                   p("1. To estimate the monthly home loan repayment", style="font-family: 'times'; font-size: 15pt"),
                   p("2. To estimate how many percentage of the total payment goes into interest and principal repayment", style="font-family: 'times'; font-size: 15pt"),
                   p("3. To estimate the interest, principal repayment and balance after each monthly payment", style="font-family: 'times'; font-size: 15pt"),
                   
                   h2("How to use:"),
                   p("1. Enter your ", code("Home Price"), "(", span(em("in MYR"), style="color:blue"), ")", style="font-family: 'times'; font-size: 15pt"),
                   p("2. Enter your ", code("Down Payment"), " amount (", span(em("in MYR"), style="color:blue"), ")", style="font-family: 'times'; font-size: 15pt"),
                   p("3. Slide to your ", code("Interest Rate"), "(", span(em("Annual Interest Rate in Percentage"), style="color:blue"), ")", style="font-family: 'times'; font-size: 15pt"),
                   p("4. Slide to your ", code("Loan Period"), "(", span(em("in Years"), style="color:blue"), ")", style="font-family: 'times'; font-size: 15pt")
          ),
          tabPanel("Payment Summary", h3("Your monthly payment:",textOutput("resultPayment")), plotOutput("resultPie")),
          tabPanel("Payments Table", dataTableOutput("resultTable")))
      )
      
    ) #sidebarLayout ends
  )#fluidPage ends
) 
