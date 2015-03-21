library(shiny)

shinyUI(fluidPage(
  titlePanel("Tidal volume calculator"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("gender", label = h4("Gender"),
                   choices = list("Male" = 1, "Female" = 2), selected = 1),
      numericInput("height", label = h4("Height in centimetres"), 0),
      submitButton("Calculate"),
      h3("Results"),
      h4("Ideal body weight (kg): "),
      verbatimTextOutput("ibw"),
      h4("Target tidal volume (ml)(approx 6ml/kg): "),
      verbatimTextOutput("vt")
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
      p("Enter a gender and a height in centimetres in the panel on the left and this 
        application will estimate ideal body weight and give an (appropriately rounded)
         target tidal volume when \"Calculate\" is pressed. The application uses the 
        Robinson formula[3]."),

      h3("References"),
      p(HTML("[1] <a href=\"http://www.nejm.org/doi/full/10.1056/NEJM200005043421801\">ARDSNet 
           trial</a> Ventilation with Lower Tidal Volumes as Compared with 
           Traditional Tidal Volumes for Acute Lung Injury and the Acute Respiratory 
           Distress Syndrome, <i>N Engl J Med</i> 2000; <b>342</b>:1301-1308")),
      p(HTML("[2] <a href=\"http://jama.jamanetwork.com/article.aspx?articleid=1832542\">
           Ogden CL, <i>et al</i></a> Prevalence of childhood and adult obesity in the 
           United States, 2011-2012.<i>JAMA</i> 2014 Feb 26; <b>311(8)</b>:806-14")),
      p(HTML("[3] <a href=\"http://www.ncbi.nlm.nih.gov/pubmed/6869387\">Robinson JD 
             <i>et al</i></a> Determination of ideal body weight for drug dosage 
             calculations. <i>Am J Hosp Pharm</i> 1983 Jun; <b>40(6)</b>:1016-9.")),
      p(HTML("Code for this Shiny application is available on 
             <a href=\"https://github.com/iainxingham/DataProductsProject\">
             github</a>."))
    )
  )
))