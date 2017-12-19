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
                   h2("Function:"),
                   p("1. To estimate the monthly home loan repayment", style="font-family: 'times'; font-size: 12pt"),
                   p("2. To estimate how many percentage of the total payment goes into interest and principal repayment", style="font-family: 'times'; font-size: 12pt"),
                   p("3. To estimate the interest, principal repayment and balance after each monthly payment", style="font-family: 'times'; font-size: 12pt"),
                   
                   h2("How to use:"),
                   p("1. Enter your ", code("Home Price"), "(", span(em("in MYR"), style="color:blue"), ")", style="font-family: 'times'; font-size: 12pt"),
                   p("2. Enter your ", code("Down Payment"), " amount (", span(em("in MYR"), style="color:blue"), ")", style="font-family: 'times'; font-size: 12pt"),
                   p("3. Slide to your ", code("Interest Rate"), "(", span(em("Annual Interest Rate in Percentage"), style="color:blue"), ")", style="font-family: 'times'; font-size: 12pt"),
                   p("4. Slide to your ", code("Loan Period"), "(", span(em("in Years"), style="color:blue"), ")", style="font-family: 'times'; font-size: 12pt"),
                   
                   h2("Bank rates:"),
                   p("Maybank : ", code("4.55%"), style="font-family: 'times'; font-size: 12pt"),
                   p("Public Bank : ", code("4.45%"), style="font-family: 'times'; font-size: 12pt"),
                   p("Standard Chartered Bank : ", code("4.67%"), style="font-family: 'times'; font-size: 12pt"),
                   p("Affin Bank : ", code("4.75%"), style="font-family: 'times'; font-size: 12pt"),
                   p("AmBank : ", code("4.45%"), style="font-family: 'times'; font-size: 12pt"),
                   p("Hong Leong Bank : ", code("4.80%"), style="font-family: 'times'; font-size: 12pt"),
                   p("Alliance Bank : ", code("4.65%"), style="font-family: 'times'; font-size: 12pt"),
                   p("CIMB Bank : ", code("4.65%"), style="font-family: 'times'; font-size: 12pt"),
                   p("RHB Bank : ", code("4.65%"), style="font-family: 'times'; font-size: 12pt"),
                   p("OCBC Bank : ", code("5.05%"), style="font-family: 'times'; font-size: 12pt"),
                   p("UOB : ", code("4.75%"), style="font-family: 'times'; font-size: 12pt"),
                   p("HSBC Bank : ", code("4.85%"), style="font-family: 'times'; font-size: 12pt")
                   
          ),
          tabPanel("Payment Summary", h3("Your monthly payment:",textOutput("resultPayment")), plotOutput("resultPie")),
          tabPanel("Payments Table", dataTableOutput("resultTable")))
      )
      
    ) #sidebarLayout ends
  )#fluidPage ends
) 
