library(shiny)

shinyUI(fluidPage(
  titlePanel("Tidal volume calculator"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("gender", label = h4("Gender"),
                   choices = list("Male" = 1, "Female" = 2), selected = 1),
      numericInput("height", label = h4("Height in centimetres"), 0),
      submitButton("Calculate")
    ),
  
    mainPanel(
      h3("Introduction"),
      p("Patients in the intensive care unit often require mechanical ventilation - 
        mechanical support for breathing. The treating physician selects ventilator 
        settings based on many parameters including the patient's size, oxygen levels,
        etc. Traditionally ventilators were set to deliver large breaths (also known as
        the tidal volume, Vt) of up to 15 millilitres per kilogram body weight to 
        patients. It has been increasingly recognised that such large tidal volumes are 
        potentially harmful[1] and current critical care practice is to limit Vt to much 
        lower levels (ideally no higher than 6ml/kg) even at the expense of other 
        physiological parameters."),
      p(HTML("The body weight used for tidal volume calculations is the patient's <b>
           ideal</b> body weight, an estimate of the patient's optimum healthy 
           weight, not their <b>actual</b> weight. With over a third of adult 
           Americans being obese[2], using actual body weight can lead to excessive 
           tidal volumes and hence ventilator associated barotrauma.")),
      h3("Instructions"),
      p("<to go here>"),
      h3("Calculations"),
      h4("Ideal body weight (kg): "),
      verbatimTextOutput("ibw"),
      h4("Target tidal volume (approx 6ml/kg): "),
      verbatimTextOutput("vt"),
      h3("References"),
      p(HTML("[1] <a href=\"http://www.nejm.org/doi/full/10.1056/NEJM200005043421801\">ARDSNet 
           trial</a> - Ventilation with Lower Tidal Volumes as Compared with 
           Traditional Tidal Volumes for Acute Lung Injury and the Acute Respiratory 
           Distress Syndrome, <i>N Engl J Med</i> 2000; <b>342</b>:1301-1308")),
      p(HTML("[2] <a href=\"http://jama.jamanetwork.com/article.aspx?articleid=1832542\">
           Ogden CL, <i>et al</i></a> Prevalence of childhood and adult obesity in the 
           United States, 2011-2012.<i>JAMA</i>. 2014 Feb 26;<b>311(8)</b>:806-14"))
    )
  )
))