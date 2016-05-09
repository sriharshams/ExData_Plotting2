## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## Author: Sriharsha M S
## Question:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/course-project")
getwd()
# Read PM2.5 emissions dataset
NEI <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')


# Get the emissions in Baltimore City
baltimore_emissions = NEI[NEI$fips == '24510', ]

# Get the total emissions in Baltimore City by year
baltimore_emission_totals_by_year <- aggregate(Emissions ~ year, data = baltimore_emissions, FUN = sum)

setwd("C:/learning/coursera/data_science/exploratory_data_analysis/week4/assignment/ExData_Plotting2")
getwd()
# Open png device
png(filename='plot2.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(baltimore_emission_totals_by_year, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='Total PM2.5 Emissions in Baltimore City')
})

# Close png device
dev.off()