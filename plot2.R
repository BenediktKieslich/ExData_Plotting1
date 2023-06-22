
```{r}
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
m_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(m_data$Date, m_data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(m_data$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
```


