###########################################################
# UI definitions for the NOTES module
# 
# Author: Stefan Schliebs
# Created: 2017-07-31
###########################################################


notesModuleUI <- function(id) {
  # obtain namespace
  ns <- NS(id)
  useShinyjs()
  
  tagList(
    
    # Filter UI ---------------------------------------------------------------
    
    material_card(
      fluidRow(
        column(
          width = 12,
          sliderInput(ns("year"), label = "Select sighting year range", min = 1906, max = 2014, value = c(1924, 1964), sep = "", width = "100%")
        ),
        column(
          width = 6,
          uiOutput(ns("filter_continent")) %>% withSpinner(type = 3, color.background = "white")
        ),
        column(
          width = 6,
          uiOutput(ns("filter_shape")) %>% withSpinner(type = 3, color.background = "white")
        )
      )
    ),

    
    # Wordcloud ---------------------------------------------------------------
    
    material_card(
      fluidRow(
        column(
          width = 12,
          d3wordcloudOutput(ns("wordcloud"))
        )
      )
    )
  )
}