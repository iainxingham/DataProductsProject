library(shiny)

idealbodyweight <- function(height, gender) {
  #if(height==0)
  
  ht <- (height-152.4)/2.54
  if(gender==1) ht <- (ht*1.9)+52
  if(gender==2) ht <- (ht*1.7)+49
  ht
}

shinyServer(
  function(input, output) {
    output$ibw <- renderPrint({round(idealbodyweight(input$height, input$gender),1)})
    output$vt <- renderPrint({signif(idealbodyweight(input$height, input$gender)*6,2)})
  }
)