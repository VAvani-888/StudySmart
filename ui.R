
library(shiny)

shinyUI(fluidPage(
    
    tags$head(
        tags$style(HTML("
      body {
        background: #F4F7FB;
        color: #202B3C;
        font-family: 'Helvetica Neue', Arial, sans-serif;
      }

      .container-fluid {
        max-width: 1440px;
        padding: 24px 34px;
      }

      .hero {
        background: linear-gradient(120deg, #172554, #1D4ED8);
        color: white;
        padding: 30px 34px;
        border-radius: 18px;
        margin-bottom: 26px;
        box-shadow: 0 8px 24px rgba(30, 64, 175, 0.14);
      }

      .hero h1 {
        margin-top: 0;
        font-weight: 750;
        font-size: 32px;
      }

      .hero p {
        color: #DBEAFE;
        font-size: 16px;
        margin-bottom: 0;
        line-height: 1.6;
      }

      .section-heading {
        font-size: 22px;
        font-weight: 700;
        margin: 8px 0 16px;
      }

      .well {
        background: white;
        border: 1px solid #E2E8F0;
        border-radius: 16px;
        box-shadow: 0 4px 16px rgba(15, 23, 42, 0.04);
        padding: 24px;
      }

      .control-label {
        color: #334155;
        font-weight: 650;
      }

      .irs-bar, .irs-bar-edge, .irs-single {
        background: #2563EB;
        border-color: #2563EB;
      }

      .irs-from, .irs-to {
        background: #1D4ED8;
      }

      .metric-card {
        background: white;
        border: 1px solid #E2E8F0;
        border-radius: 16px;
        padding: 24px;
        margin-bottom: 20px;
        box-shadow: 0 4px 16px rgba(15, 23, 42, 0.04);
      }

      .metric-label {
        color: #64748B;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 12px;
        font-weight: 700;
      }

      .score-number {
        color: #1D4ED8;
        font-size: 38px;
        font-weight: 800;
        margin: 8px 0;
      }

      .result-note {
        color: #475569;
        line-height: 1.65;
      }

      .chart-card {
        background: white;
        border: 1px solid #E2E8F0;
        border-radius: 16px;
        padding: 22px;
        margin-bottom: 20px;
        box-shadow: 0 4px 16px rgba(15, 23, 42, 0.04);
      }

      .help-card {
        background: #EFF6FF;
        border-left: 4px solid #2563EB;
        border-radius: 8px;
        padding: 16px 20px;
        margin-top: 18px;
        color: #334155;
        line-height: 1.65;
      }

      .footer-note {
        color: #64748B;
        font-size: 12px;
        margin-top: 20px;
      }

      h3 {
        font-weight: 700;
        color: #1E293B;
      }
    "))
    ),
    
    div(
        class = "hero",
        h1("StudySmart"),
        p("STUDY PERFORMANCE EXPLORER"),
        br(),
        p("Explore your study routine through an interactive index of study time, attendance, and sleep. Adjust your habits and see how your results change.")
    ),
    
    sidebarLayout(
        
        sidebarPanel(
            h3("Your study routine"),
            p("Adjust the values below to explore different scenarios."),
            
            sliderInput(
                "study_hours",
                "Study hours per day",
                min = 0, max = 10, value = 4, step = 0.5
            ),
            
            sliderInput(
                "attendance",
                "Class attendance (%)",
                min = 0, max = 100, value = 75, step = 5
            ),
            
            sliderInput(
                "sleep_hours",
                "Sleep hours per night",
                min = 4, max = 10, value = 7, step = 0.5
            ),
            
            div(
                class = "help-card",
                strong("How to use StudySmart"),
                br(),
                "1. Set your average daily study hours.",
                br(),
                "2. Enter your class attendance percentage.",
                br(),
                "3. Set your average nightly sleep.",
                br(),
                "4. Review the index and red marker on the chart."
            )
        ),
        
        mainPanel(
            
            h3("Your overview", class = "section-heading"),
            
            div(
                class = "metric-card",
                div(class = "metric-label", "STUDY HABIT INDEX"),
                div(
                    class = "score-number",
                    textOutput("score", inline = TRUE)
                ),
                tags$hr(),
                strong("What your result means"),
                p(
                    class = "result-note",
                    textOutput("interpretation", inline = TRUE)
                )
            ),
            
            div(
                class = "chart-card",
                h3("Study hours & habit index"),
                p(
                    class = "result-note",
                    "Compare your selected habits with illustrative example points."
                ),
                plotOutput("studyPlot", height = "390px")
            ),
            
            div(
                class = "help-card",
                strong("How to interpret this index"),
                br(),
                "The index is a simplified, illustrative calculation based on the three selected inputs. It is not an exam score, a validated academic prediction, or a measure of intelligence. The black chart points are synthetic examples; the red point represents your current selection."
            ),
            
            p(
                class = "footer-note",
                "STUDYSMART  |  An interactive learning project"
            )
        )
    )
))


