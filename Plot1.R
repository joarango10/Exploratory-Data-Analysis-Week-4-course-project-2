
## read in emissions data and classification code
NEI <- readRDS("C:/Users/Administrator/Desktop/Exploratory-Data-Analysis-Week-4-course-project-2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Administrator/Desktop/Exploratory-Data-Analysis-Week-4-course-project-2/Source_Classification_Code.rds")

## add up the total emissions for each year
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

## create the plot
png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, 
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()