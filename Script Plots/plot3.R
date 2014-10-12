#After download and extract...

#Choose your file
base <- read.table(file.choose(), sep=";", header = T)

#Converting
base$Date <- as.Date(base$Date, format="%d/%m/%Y")

#Filtering
baseFiltro <- subset(base, Date >= as.Date("2007-02-01"))
baseFiltro <- subset(baseFiltro, Date <= as.Date("2007-02-02"))

#Converting again
baseFiltro$Sub_metering_1 <- as.numeric(as.character(baseFiltro$Sub_metering_1))
baseFiltro$Sub_metering_2 <- as.numeric(as.character(baseFiltro$Sub_metering_2))
baseFiltro$Sub_metering_3 <- as.numeric(as.character(baseFiltro$Sub_metering_3))

#WARNING: I used Brazil's weekday, so "Qui"="Thu", "Sex"="Fri" and "Sáb"="Sat"
baseFiltro$Tempo <- as.POSIXct(paste(baseFiltro$Date, baseFiltro$Time), format="%Y-%m-%d %H:%M:%S")

#Plot3
png(file = "plot3.png", bg = "transparent",width = 480, height = 480)
plot(baseFiltro$Tempo,baseFiltro$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",)
lines(baseFiltro$Tempo,baseFiltro$Sub_metering_1,col="black")
lines(baseFiltro$Tempo,baseFiltro$Sub_metering_2,col="red")
lines(baseFiltro$Tempo,baseFiltro$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()