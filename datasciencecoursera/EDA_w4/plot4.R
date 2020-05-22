NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalcodes <- SCC[grepl("[Cc]oal", SCC$Short.Name)&grepl("[Cc]omb", SCC$Short.Name),]$SCC
coaldata <- NEI[NEI$SCC %in% coalcodes,]
coalsum <- tapply(coaldata$Emissions, coaldata$year, sum)

png("plot4.png")
barplot(coalsum, xlab="year", ylab="emissions",main="Emission from coal-related sources")
dev.off()