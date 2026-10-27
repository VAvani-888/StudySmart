library(shiny)

shinyUI(
  fluidPage(
    tags$head(
      tags$style(HTML("
        body {
          background: #f4f7fc;
          color: #202b40;
          font-family: -apple-system, BlinkMacSystemFont,
                       'Segoe UI', sans-serif;
        }

        .container-fluid {
          max-width: 1500px;
          padding: 28px;
        }

        .hero {
          background: linear-gradient(115deg, #192858, #2458e8);
          color: white;
          padding: 30px 34px;
          border-radius: 20px;
          margin-bottom: 26px;
          box-shadow: 0 12px 28px rgba(28, 54, 115, 0.12);
        }

        .hero h1 {
          font-weight: 750;
          margin-top: 0;
        }

        .hero p {
          font-size: 16px;
          line-height: 1.6;
        }

        .panel-card {
          background: white;
          border: 1px solid #dce5f2;
          border-radius: 18px;
          padding: 24px;
          margin-bottom: 22px;
          box-shadow: 0 5px 18px rgba(25, 40, 88, 0.04);
        }

        .panel-card h3 {
          font-weight: 700;
          margin-top: 0;
        }

        .score-label {
          color: #637692;
          font-size: 13px;
          font-weight: 750;
          letter-spacing: 1px;
        }

        .score-value {
          color: #2458e8;
          font-size: 40px;
          font-weight: 800;
          margin: 10px 0 18px;
        }

        .interpretation {
          color: #455873;
          line-height: 1.65;
        }

        .help-card {
          background: #eef5ff;
          border-left: 5px solid #2864ff;
          border-radius: 10px;
          padding: 16px;
          line-height: 1.7;
          color: #34465f;
          margin-top: 24px;
        }

        .disclaimer {
          font-size: 12px;
          color: #65758b;
          line-height: 1.6;
          margin-top: 14px;
        }

        .footer-note {
          color: #718096;
          font-size: 12px;
          text-align: center;
          margin: 20px 0;
        }

        .control-label {
          font-weight: 700;
          color: #34445e;
        }
      "))
    ),
    
    div(
      class = "hero",
      h1("StudySmart"),
      p("STUDY PERFORMANCE EXPLORER"),
      p(
        "Explore how study time, class attendance, and sleep ",
        "contribute to your study habit index. Adjust your habits ",
        "to compare different scenarios and identify areas to improve."
      )
    ),
    
    fluidRow(
      column(
        width = 4,
        
        div(
          class = "panel-card",
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
            tags$ol(
              tags$li("Set your average daily study hours."),
              tags$li("Enter your class attendance percentage."),
              tags$li("Set your average nightly sleep."),
              tags$li("Review your index and the component breakdown.")
            )
          )
        )
      ),
      
      column(
        width = 8,
        
        h3("Your overview"),
        
        div(
          class = "panel-card",
          div(class = "score-label", "STUDY HABIT INDEX"),
          div(class = "score-value", textOutput("score")),
          tags$hr(),
          strong("What your result means"),
          div(
            class = "interpretation",
            textOutput("interpretation")
          ),
          div(
            class = "disclaimer",
            "This index is an illustrative tool based on simple ",
            "assumptions. It is not a prediction of grades or a ",
            "validated measure of academic performance."
          )
        ),
        
        div(
          class = "panel-card",
          h3("Your Study Habit Breakdown"),
          p(
            "See how study time, attendance, and sleep contribute ",
            "to your overall index."
          ),
          plotOutput("studyPlot", height = "300px"),
          div(
            class = "disclaimer",
            "Component scores are illustrative, not measured ",
            "academic outcomes. The overall index uses a weighted ",
            "combination of these components."
          )
        )
      )
    ),
    
    p(
      class = "footer-note",
      "STUDYSMART  |  An interactive learning project"
    )
  )
)

