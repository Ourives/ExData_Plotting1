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

#Plot 1
png(file = "plot1.png", bg = "transparent",width = 480, height = 480)
hist(baseFiltro$Global_active_power,col="red", ylim=c(0, 1200), 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")
dev.off()
