#After download and extract...

#Choose your file
base <- read.table(file.choose(), sep=";", header = T)

#Converting
base$Date <- as.Date(base$Date, format="%d/%m/%Y")

#Filtering
baseFiltro <- subset(base, Date >= as.Date("2007-02-01"))
baseFiltro <- subset(baseFiltro, Date <= as.Date("2007-02-02"))

#Converting again
baseFiltro$Global_active_power <- as.numeric(as.character(baseFiltro$Global_active_power))
baseFiltro$Global_reactive_power <- as.numeric(as.character(baseFiltro$Global_reactive_power))
baseFiltro$Sub_metering_1 <- as.numeric(as.character(baseFiltro$Sub_metering_1))
baseFiltro$Sub_metering_2 <- as.numeric(as.character(baseFiltro$Sub_metering_2))
baseFiltro$Sub_metering_3 <- as.numeric(as.character(baseFiltro$Sub_metering_3))
baseFiltro$Voltage <- as.numeric(as.character(baseFiltro$Voltage))

#WARNING: I used Brazil's weekday, so "Qui"="Thu", "Sex"="Fri" and "Sáb"="Sat"
baseFiltro$Tempo <- as.POSIXct(paste(baseFiltro$Date, baseFiltro$Time), format="%Y-%m-%d %H:%M:%S")


#Plot4
png(file = "plot4.png", bg = "transparent",width = 480, height = 480)
par(mfrow=c(2,2),bg=NA)

plot(baseFiltro$Tempo,baseFiltro$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(baseFiltro$Tempo,baseFiltro$Global_active_power)

plot(baseFiltro$Tempo,baseFiltro$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(baseFiltro$Tempo,baseFiltro$Voltage)

plot(baseFiltro$Tempo,baseFiltro$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",)
lines(baseFiltro$Tempo,baseFiltro$Sub_metering_1,col="black")
lines(baseFiltro$Tempo,baseFiltro$Sub_metering_2,col="red")
lines(baseFiltro$Tempo,baseFiltro$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(baseFiltro$Tempo,baseFiltro$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(baseFiltro$Tempo,baseFiltro$Global_reactive_power)
dev.off()