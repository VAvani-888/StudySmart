
library(shiny)

shinyServer(function(input, output) {
  
  # Calculate an illustrative study habit index from 0 to 100
  study_components <- reactive({
    
    # Diminishing returns from additional study hours
    study_component <- 100 *
      (1 - exp(-input$study_hours / 3.5)) /
      (1 - exp(-10 / 3.5))
    
    # Attendance contributes directly
    attendance_component <- input$attendance
    
    # Sleep score peaks at 8 hours and decreases gradually
    sleep_component <- 100 * exp(
      -0.5 * ((input$sleep_hours - 8) / 1.5)^2
    )
    
    list(
      Study = min(100, max(0, study_component)),
      Attendance = min(100, max(0, attendance_component)),
      Sleep = min(100, max(0, sleep_component))
    )
  })
  
  study_score <- reactive({
    components <- study_components()
    
    round(
      0.40 * components$Study +
        0.35 * components$Attendance +
        0.25 * components$Sleep
    )
  })
  
  # Display the calculated index
  output$score <- renderText({
    paste(study_score(), "/ 100")
  })
  
  # Explain the result
  output$interpretation <- renderText({
    score <- study_score()
    components <- study_components()
    
    weakest <- names(which.min(unlist(components)))
    
    if (score >= 80) {
      paste(
        "Strong study habit index.",
        "Your lowest-scoring area is",
        tolower(weakest),
        "- consider whether it needs attention."
      )
    } else if (score >= 60) {
      paste(
        "Moderate study habit index.",
        "Your lowest-scoring area is",
        tolower(weakest),
        "- consider one realistic improvement."
      )
    } else {
      paste(
        "There is room to improve.",
        "Start with your lowest-scoring area:",
        tolower(weakest),
        "and make gradual changes."
      )
    }
  })
  
  # Display component scores instead of misleading comparisons
  output$studyPlot <- renderPlot({
    
    components <- unlist(study_components())
    
    barplot(
      components,
      ylim = c(0, 100),
      ylab = "Component score (0-100)",
      main = "Your Study Habit Breakdown",
      col = c("steelblue", "darkseagreen3", "goldenrod2"),
      border = NA,
      las = 1
    )
    
    abline(h = 50, lty = 2, col = "grey50")
  })
  
})

    })
    
})
