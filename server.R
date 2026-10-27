
library(shiny)

shinyServer(function(input, output) {
    
    # Calculate a study habit index from 0 to 100
    study_score <- reactive({
        study_component <- (input$study_hours / 10) * 100
        attendance_component <- input$attendance
        
        sleep_component <- max(
            0,
            100 - abs(input$sleep_hours - 8) * 20
        )
        
        round(
            0.45 * study_component +
                0.35 * attendance_component +
                0.20 * sleep_component
        )
    })
    
    # Display the calculated index
    output$score <- renderText({
        paste(study_score(), "/ 100")
    })
    
    # Explain the result
    output$interpretation <- renderText({
        score <- study_score()
        
        if (score >= 80) {
            "Strong study habit index. Keep your routine consistent."
        } else if (score >= 60) {
            "Moderate study habit index. Look for one habit you can improve."
        } else {
            "There is room to improve. Try adjusting your routine gradually."
        }
    })
    
    # Create illustrative example data for the chart
    output$studyPlot <- renderPlot({
        
        example_students <- data.frame(
            study_hours = c(1, 2, 2.5, 3, 3.5, 4, 4.5, 5,
                            5.5, 6, 6.5, 7, 8, 9),
            habit_index = c(25, 35, 32, 45, 42, 55, 52, 65,
                            60, 72, 68, 78, 85, 92)
        )
        
        plot(
            example_students$study_hours,
            example_students$habit_index,
            xlim = c(0, 10),
            ylim = c(0, 100),
            xlab = "Study hours per day",
            ylab = "Illustrative study habit index",
            main = "Study Hours and Study Habit Index",
            pch = 16
        )
        
        # Mark the user's current selection
        points(
            input$study_hours,
            study_score(),
            col = "red",
            pch = 19,
            cex = 1.7
        )
        
        legend(
            "topleft",
            legend = c("Illustrative examples", "Your selected habits"),
            col = c("black", "red"),
            pch = 19,
            bty = "n"
        )
    })
    
})
