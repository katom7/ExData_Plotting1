#install.packages("dplyr", repos="http://cran.us.r-project.org")
library(dplyr)
data = read.table(file="household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
data2 <- filter(data,grepl("^[12]/2/2007",data$Date))
data2$DateTime <- strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
data2$Global_active_power <- as.numeric(data2$Global_active_power)

par(mfrow=c(1,1))
with(data2,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(data2,lines(DateTime,Global_active_power))

dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()
