NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

carcodes <- SCC[grepl("Highway", SCC$Short.Name)|grepl("Off-highway", SCC$Short.Name),]$SCC
cardata <- NEI[NEI$SCC %in% carcodes&NEI$fips=="24510",]
carsum <- tapply(cardata$Emissions, cardata$year, sum)

png("plot5.png")
barplot(carsum, xlab="year", ylab="emissions",main="Emission from motor vehicles in Baltimore City")
dev.off()