#install.packages("dplyr", repos="http://cran.us.r-project.org")
library(dplyr)
data = read.table(file="household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
data2 <- filter(data,grepl("^[12]/2/2007",data$Date))
data2$DateTime <- strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

data2$Global_active_power <- as.numeric(data2$Global_active_power)

data2$Voltage <- as.numeric(data2$Voltage)

data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)

par(mfrow=c(2,2))

with(data2,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Global Active Power"))
with(data2,lines(DateTime,Global_active_power))

with(data2,plot(DateTime,Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(data2,lines(DateTime,Voltage))

with(data2,plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(data2,lines(DateTime,Sub_metering_1,col="black"))
with(data2,lines(DateTime,Sub_metering_2,col="red"))
with(data2,lines(DateTime,Sub_metering_3,col="blue"))
type <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
cols <- c("black","red","blue")
legend("topright", legend = type, pch = NA_integer_, lty = 1, col = cols, bty="n")

with(data2,plot(DateTime,Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power"))
with(data2,lines(DateTime,Global_reactive_power))

dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()

par(mfrow=c(2,2))
