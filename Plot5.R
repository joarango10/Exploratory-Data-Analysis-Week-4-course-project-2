## read in emissions data and classification code
NEI <- readRDS("C:/Users/Administrator/Desktop/Exploratory-Data-Analysis-Week-4-course-project-2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Administrator/Desktop/Exploratory-Data-Analysis-Week-4-course-project-2/Source_Classification_Code.rds")

# merge the two data sets

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# 24510 is Baltimore
# Searching for ON-ROAD type in NEI

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plots5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*"Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()