
library(dplyr)
library(data.table)
library(ggplot2)
library(tidyverse)

pak_data1 <- read.csv("F:/DS/Pakistan Datasets World Bank/Data_Extract_From_World_Development_Indicators/3dfeae41-3295-4e42-b691-597225bb0797_Data.csv", header = TRUE)

pak_data1 <- pak_data1[-(56:60),]
pak_data1 <- pak_data1[ , -(1:2)]
pak_data1 <- pak_data1[ , -2]
pak_data1 <- pak_data1[ , -13]

colnames(pak_data1) <- c("Series_Name","1990","2000", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018" )

df2 <- data.frame(t(pak_data1[-1]))
colnames(df2) <- pak_data1[, 1]

df2 <-tibble::rownames_to_column(df2, "year")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    #Adding text for application explanation
    output$explaination <- renderText({
        ("Overview:
         This simple shiny app takes data from the World Bank data of a county 'X' and shows 5 data variables namely Population, Population Growth Rate,
         Population Density, Fertitility Rate and Mortality rate under age 5 plotted against the year on the X axis broadly giving idea of the popultion 
         strength of the country. The selection of the respective variable can be done from the dropdown menu on the left giving the resulted graph adjacent to it. ")
    })

    output$Plot <- renderPlot({

        # generate a plot of the selected variable depending on the selection of variable
        
        ggplot(df2, aes_(x = as.name("year"), (y= as.name(input$Series_Type)))) + geom_line() +geom_point() 
        
    })

})
