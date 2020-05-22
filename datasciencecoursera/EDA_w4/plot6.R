NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
carcodes <- SCC[grepl("Highway", SCC$Short.Name)|grepl("Off-highway", SCC$Short.Name),]$SCC
cardata <- NEI[NEI$SCC %in% carcodes&(NEI$fips=="24510"|NEI$fips=="06037"),]
carsummary <- aggregate(cardata$Emissions, by=list(fips=cardata$fips, year=cardata$year), FUN=sum)
carsummary$relative <- carsummary$x/carsummary$x[1:2]
g <- ggplot(data=carsummary, aes(x=year,y=relative))

png("plot6.png")
g+geom_line(aes(col=fips))+ggtitle("Relative emission from motor vehicles in Baltimore City and Los Angeles")
dev.off()