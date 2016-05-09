## Course: Exploratory Data Analysis (https://www.coursera.org/learn/exploratory-data-analysis/)
## Assignment: Course Project 2
## Author: Sriharsha M S
## Question:
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?


library(ggplot2)

setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/course-project")
getwd()
# Read PM2.5 emissions dataset
NEI <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
SCC <- readRDS('Source_Classification_Code.rds')


# Get the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510') and Los Angeles (fips code: '06037')
city_emissions <- NEI[NEI$type == 'ON-ROAD' & NEI$fips %in% c('24510', '06037'), ]

# Get the total emissions for Baltimore City and Los Angeles, grouped by year and city
city_emissions_by_year <- aggregate(Emissions ~ year + fips, data = city_emissions, FUN = sum)

# Add city names for use in the plot
city_emissions_by_year$city = city_emissions_by_year$fips
city_emissions_by_year[which(city_emissions_by_year$fips == '24510'), 'city'] = 'Baltimore City'
city_emissions_by_year[which(city_emissions_by_year$fips == '06037'), 'city'] = 'Los Angeles'

setwd("C:/learning/coursera/data_science/exploratory_data_analysis/week4/assignment/ExData_Plotting2")
getwd()
# Open png device
png(filename='plot6.png', width=640, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)



plot6 <- qplot(year, Emissions, data=city_emissions_by_year, geom="line", color=fips) +
  ggtitle(expression("Total PM2.5 Emissions in Los Angeles (06037) and Baltimore City (24510)")) +
  xlab("Year") +
  ylab(expression("PM2.5 Emissions (tons)"))


print(plot6)

# Close png device
dev.off()