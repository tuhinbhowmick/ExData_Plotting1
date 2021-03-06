## read data
hdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

## transform data
#hdata$Date <- as.Date(hdata$Date, format="%d/%m/%Y")
hdata$dt <- strptime(paste(hdata$Date,hdata$Time,sep = " " ),format="%d/%m/%Y %H:%M:%S")

## Filter data
fdate <- strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
tdate <- strptime("03/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
tdata <- hdata[hdata$dt >= fdate & hdata$dt <= tdate,]

png(file = "plot3.png", width = 480, height = 480, units = "px",bg="transparent")

with(tdata,plot(dt,Sub_metering_1,type="l",ylab = "Energy sub metering",
                xlab = "",
                main = ""))
points(tdata$dt,tdata$Sub_metering_2,col="Red",type = "l")
points(tdata$dt,tdata$Sub_metering_3,col="Blue",type = "l")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black","red","blue"),
       ncol = 1)

dev.off()