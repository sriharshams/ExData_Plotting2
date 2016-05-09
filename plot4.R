## Course: Exploratory Data Analysis (https://www.coursera.org/learn/exploratory-data-analysis/)
## Assignment: Course Project 2
## Author: Sriharsha M S
## Question:
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/course-project")
getwd()
# Read PM2.5 emissions dataset
NEI <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
SCC <- readRDS('Source_Classification_Code.rds')


# Get the coal combustion-related sources
# Use the 'Short.Name' field to find the coal combustion-related sources
scc_coal <- SCC[grep('coal', SCC$Short.Name), ]

# Get the emissions from coal combustion-related sources
coal_emissions <- NEI[NEI$SCC %in% scc_coal$SCC, ]
# Get the total emissions from coal combustion-related sources by year
coal_emissions_by_year <- aggregate(Emissions ~ year, data = coal_emissions, FUN = sum)

setwd("C:/learning/coursera/data_science/exploratory_data_analysis/week4/assignment/ExData_Plotting2")
getwd()
# Open png device
png(filename='plot4.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(coal_emissions_by_year, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='PM2.5 Emissions from coal combustion sources in U.S.A.')
})

# Close png device
dev.off()