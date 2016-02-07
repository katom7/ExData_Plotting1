#install.packages("dplyr", repos="http://cran.us.r-project.org")
library(dplyr)
data = read.table(file="household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
data2 <- filter(data,grepl("^[12]/2/2007",data$Date))
data2$DateTime <- strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

#png("plot1.png")
par(mfrow=c(1,1))
with(data2,plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(data2,lines(DateTime,Sub_metering_1,col="black"))
with(data2,lines(DateTime,Sub_metering_2,col="red"))
with(data2,lines(DateTime,Sub_metering_3,col="blue"))

type <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
cols <- c("black","red","blue")
legend("topright", legend = type, pch = NA_integer_, lty = 1, col = cols)

dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()
