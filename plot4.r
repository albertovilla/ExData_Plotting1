Sys.setlocale('LC_TIME', 'C')
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings= "?")

hpc$datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %T")
hpc$Date <- as.Date(strptime(hpc$Date, format="%d/%m/%Y"))

hpcEx <- subset(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02" )

# Plot 4
png(filename="plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,1.5,1.5), oma=c(1,2,1,2))
plot(hpcEx$datetime, hpcEx$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex.lab=0.75)
plot(hpcEx$datetime, hpcEx$Voltage, xlab="datetime", ylab="Voltage", type="l", cex.lab=0.75)
plot(hpcEx$datetime, hpcEx$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", cex.lab=0.75)
lines(hpcEx$datetime, hpcEx$Sub_metering_2, type="l", col= "red")
lines(hpcEx$datetime, hpcEx$Sub_metering_3, type="l", col= "blue")
legend("topright", lty=c(1,1,1) ,col= c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7, bty="n")
plot(hpcEx$datetime, hpcEx$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type= "l", cex.lab=0.75)
dev.off()