## Course: Exploratory Data Analysis (https://www.coursera.org/learn/exploratory-data-analysis/)
## Assignment: Course Project 2
## Author: Sriharsha M S
## Question:
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 


setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/course-project")
getwd()
# Read PM2.5 emissions dataset
NEI <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
SCC <- readRDS('Source_Classification_Code.rds')


# Get the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510')
baltimore_motor_emissions <- NEI[NEI$type == 'ON-ROAD' & NEI$fips == '24510', ]

# Get the total Baltimore emissions from motor vehicle sources by year
baltimore_motor_emissions_by_year <- aggregate(Emissions ~ year, data = baltimore_motor_emissions, FUN = sum)

setwd("C:/learning/coursera/data_science/exploratory_data_analysis/week4/assignment/ExData_Plotting2")
getwd()
# Open png device
png(filename='plot5.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(baltimore_motor_emissions_by_year, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='PM2.5 Emissions from motor vehicle sources in Baltimore City')
})

# Close png device
dev.off()