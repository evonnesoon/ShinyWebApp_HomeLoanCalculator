
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input,output){
  #Monthly Payment Figure Output
  output$resultPayment <- renderText({
    
    initialLoan <- as.numeric(input$homeprice) - as.numeric(input$downpayment)
    balance <- initialLoan
    interestRate <- (input$irate/1200) #monthly rate
    year <- input$loanyear
    payment <- round(((balance*interestRate)/(1-(1+interestRate)^(-12*year))),2)
    paste0("RM",payment)
  }) #Monthly Payment Figure Output ends
  
  
  #Pie Chart Output
  output$resultPie <- renderPlot({
    
    initialLoan <- as.numeric(input$homeprice) - as.numeric(input$downpayment)
    interestRate <- (input$irate/1200) #monthly rate
    year <- input$loanyear
    
    firstrow <- c(0,"","","",initialLoan)
    balance <- initialLoan
    #rounded monthly payment
    payment <- round(((balance*interestRate)/(1-(1+interestRate)^(-12*year))),2)
    
    for(i in 1:((input$loanyear)*12)) {
      
      month <- as.numeric(i) #month
      interest <- round((interestRate * balance), 2) #monthly interest payment
      
      if (i != ((input$loanyear)*12)) {
        principal <- round((payment - interest), 2)
        balance <- round((balance - principal), 2)
        #interest <- (interestRate * balance) #monthly interest payment
        #principal <- (payment-interest)
        #balance <- (balance - principal)
        binded <- cbind(month, payment, interest, principal, balance)
      }      
      else {
        lastpayment <- balance + interest
        principal <- round((lastpayment - interest), 2)
        balance <- round((balance - principal), 2)
        binded <- cbind(month, lastpayment, interest, principal, balance)
      }
      
      if(exists("pie_table")!=TRUE) {
        pie_table <- cbind(month, payment, interest, principal, balance)
      }
      else {
        pie_table <- rbind(pie_table, binded) 
      }
    }
    
    total_interest <- sum(pie_table[,3]) #calculate the sum of interest paid
    total_principal <- sum(pie_table[,4]) #calculate the sum of principal paid
    pie_slice <- c(total_interest, total_principal)
    percentage_label <- c(round(pie_slice/sum(pie_slice)*100),0) #calculate the % of each slice
    pie_label <- c("Interest", "Principal") #naming the slice
    pie_label <- paste(pie_label, percentage_label) #adding the percentage value to the name of the slice
    pie_label <- paste(pie_label, "%", sep="") #adding the percentage, %, sign to the slice (without space)
    pie(pie_slice, pie_label, col=c("red", "cornsilk"), main="Payments Breakdown")
  }) #Pie Chart Output ends
  
  
  #Data Table Output
  output$resultTable <- renderDataTable({
    
    initialLoan <- as.numeric(input$homeprice) - as.numeric(input$downpayment)
    interestRate <- (input$irate/1200) #monthly rate
    year <- input$loanyear
    
    firstrow <- c(0,"","","",initialLoan)
    balance <- initialLoan
    #rounded monthly payment
    payment <- round(((balance*interestRate)/(1-(1+interestRate)^(-12*year))),2)
    
    for(i in 1:((input$loanyear)*12)) {
      
      month <- as.numeric(i) #month
      interest <- round((interestRate * balance), 2) #monthly interest payment
      
      if (i != ((input$loanyear)*12)) {
        principal <- round((payment - interest), 2)
        balance <- round((balance - principal), 2)
        #interest <- (interestRate * balance) #monthly interest payment
        #principal <- (payment-interest)
        #balance <- (balance - principal)
        binded <- cbind(month, payment, interest, principal, balance)
      }      
      else {
        lastpayment <- balance + interest
        principal <- round((lastpayment - interest), 2)
        balance <- round((balance - principal), 2)
        binded <- cbind(month, lastpayment, interest, principal, balance)
      }
      
      if(exists("complete_table")!=TRUE) {
        complete_table <- cbind(month, payment, interest, principal, balance)
      }
      else {
        complete_table <- rbind(complete_table, binded) 
      }
    }
    
    total_payments <- sum(complete_table[,2])
    total_interest <- sum(complete_table[,3])
    total_principal <- sum(complete_table[,4])
    
    tab <- cbind(total_principal,total_interest,total_payments)
    
    complete_table <- rbind(firstrow, complete_table)
    
    complete_table
    
  }) #Data Table Output ends
})
