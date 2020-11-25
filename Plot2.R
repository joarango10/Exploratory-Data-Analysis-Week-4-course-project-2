
## read in emissions data and classification code
NEI <- readRDS("C:/Users/Administrator/Desktop/Exploratory-Data-Analysis-Week-4-course-project-2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Administrator/Desktop/Exploratory-Data-Analysis-Week-4-course-project-2/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008


subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()