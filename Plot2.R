## read data
hdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

## transform data
#hdata$Date <- as.Date(hdata$Date, format="%d/%m/%Y")
hdata$dt <- strptime(paste(hdata$Date,hdata$Time,sep = " " ),format="%d/%m/%Y %H:%M:%S")

## Filter data
fdate <- strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
tdate <- strptime("03/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
tdata <- hdata[hdata$dt >= fdate & hdata$dt <= tdate,]

png(file = "plot2.png", width = 480, height = 480, units = "px",bg="transparent")

with(tdata,plot(dt,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",
                xlab = "",
                main = ""))

dev.off()