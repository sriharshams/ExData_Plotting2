## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## Author: Sriharsha M S
## Question:
## Of the four types of sources indicated by the type (point, nonpoint, 
## onroad, nonroad) variable, which of these four sources have seen decreases in emissions 
## from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)

setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/course-project")
getwd()
# Read PM2.5 emissions dataset
NEI <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
SCC <- readRDS('Source_Classification_Code.rds')


# Get the emissions in Baltimore City
baltimore_emissions = NEI[NEI$fips == '24510', ]

# Get the total emissions in Baltimore, grouped by type and year
baltimore_emission_totals <- aggregate(Emissions ~ type + year, baltimore_emissions, FUN = sum)

setwd("C:/learning/coursera/data_science/exploratory_data_analysis/week4/assignment/ExData_Plotting2")
getwd()
# Open png device
png(filename='plot3.png', width=1200, height=640, units='px')

# Print numeric values in fixed notation
options(scipen=10)

plot3 <- qplot(year, Emissions, data=baltimore_emission_totals, facets = . ~ type) +  
  geom_line() +
  xlab("Year") +
  ylab('PM2.5 Emissions (tons)') +
  ggtitle('Total PM2.5 Emissions in Baltimore City')

print(plot3)

# Close png device
dev.off()