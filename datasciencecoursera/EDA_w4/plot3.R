NEI <- readRDS("summarySCC_PM25.rds")
library(ggplot2)
NEIbalt <- NEI[NEI$fips=="24510",]
emissionSum <- aggregate(NEIbalt$Emissions, 
                         by=list(type=NEIbalt$type, year=NEIbalt$year), FUN=sum)
g <- ggplot(data=emissionSum, mapping=aes(x=year, y=x))

png("plot3.png")
g+geom_line(aes(col=emissionSum$type))
dev.off()