library(shiny)

idealbodyweight <- function(height, gender) {
  ht <- (height-152.4)/2.54
  if(gender==1) ht <- (ht*1.9)+52
  if(gender==2) ht <- (ht*1.7)+49
  ht
}

shinyServer(
  function(input, output) {
    output$ibw <- renderPrint({
      if(!is.numeric(input$height)) "Please enter a height between 153cm and 210cm"
      else if(input$height==0) "No height entered yet"
      else if((input$height < 153) | (input$height > 210)) 
        "Please enter a height between 153cm and 210cm"
      else round(idealbodyweight(input$height, input$gender),1)
    })
    output$vt <- renderPrint({
      if(!is.numeric(input$height)) NULL
      else if((input$height < 153) | (input$height > 210)) NULL
      else signif(idealbodyweight(input$height, input$gender)*6,2)
    })
  }
)