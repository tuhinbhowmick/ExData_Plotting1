## read data
hdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

## transform data
hdata$Date <- as.Date(hdata$Date, format="%d/%m/%Y")

## Filter data
fdate <- as.Date("01/02/2007","%d/%m/%Y")
tdate <- as.Date("02/02/2007","%d/%m/%Y")
tdata <- hdata[hdata$Date >= fdate & hdata$Date <= tdate,]

#unique(tdata$Date)
#dev.copy(png,file="test.png")

## set device
png(file = "plot1.png", width = 480, height = 480, units = "px",bg="transparent")

## draw graph
hist(tdata$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",ylab = "Frequency",
     main = "Global Active Power", col = "Red")

dev.off()

