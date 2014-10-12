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

#WARNING: I used Brazil's weekday, so "Qui"="Thu", "Sex"="Fri" and "Sáb"="Sat"
baseFiltro$Tempo <- as.POSIXct(paste(baseFiltro$Date, baseFiltro$Time), format="%Y-%m-%d %H:%M:%S")

#Plot2
png(file = "plot2.png", bg = "transparent",width = 480, height = 480)
plot(baseFiltro$Tempo,baseFiltro$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(baseFiltro$Tempo,baseFiltro$Global_active_power,xlab="")
dev.off()