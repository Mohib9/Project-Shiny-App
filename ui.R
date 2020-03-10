library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Country Population Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("Series_Type", "Series_Type",
                        list("Population"= "Population, total",
                             "Population Growth Rate" = "Population growth (annual %)",
                             "Population Density" = "Population density (people per sq. km of land area)",
                             "Fertility Rate"= "Fertility rate, total (births per woman)",
                             "Mortality Rate Under 5" = "Mortality rate, under-5 (per 1,000 live births)"
                             ))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot"),
            
            h3(textOutput("explaination"))
        )
    )
))
