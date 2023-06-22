```{r}
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
m_datadata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(m_datadata$Date, m_datadata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(m_datadata$Global_active_power)
GRP <- as.numeric(m_datadata$Global_reactive_power)
Voltage <- as.numeric(m_datadata$Voltage)
subMet1 <- as.numeric(m_datadata$Sub_metering_1)
subMet2 <- as.numeric(m_datadata$Sub_metering_2)
subMet3 <- as.numeric(m_datadata$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, GAP, type = "l",xlab = "", ylab = "Global Active Power")

plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMet1, type="l", xlab = "", ylab="Energy Submetering")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= , lwd=2.5, col=c("black", "red", "blue"),bty="n")

plot(datetime, GRP, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
```

