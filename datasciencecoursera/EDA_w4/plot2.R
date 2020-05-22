NEI <- readRDS("summarySCC_PM25.rds")
NEIbalt <- NEI[NEI$fips=="24510",]
yearsum <- tapply(NEIbalt$Emissions, NEIbalt$year, sum)
png("plot2.png")
barplot(yearsum, xlab="Year", ylab="Emission", main="Total emission from all sources in Baltimore City")
dev.off()