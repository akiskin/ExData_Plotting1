plot4 <- function() {
  require(data.table)
  
  data <- fread("household_power_consumption.txt", na.strings=c("?","N/A",""),data.table = FALSE)
  q <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
  q$datetime <- strptime(paste(q$Date, q$Time), "%d/%m/%Y %H:%M:%S")
  q$Voltage <- as.numeric(q$Voltage)
  q$Global_reactive_power <- as.numeric(q$Global_reactive_power)

  
  png("plot4.png")
  
    
  par(mfcol = c(2,2))
  
  
  
  plot(q$datetime, q$Global_active_power, type="l", main = "", xlab = "", ylab = "Global Active Power")
  
  
  q$Sub_metering_1 <- as.numeric(q$Sub_metering_1)
  
  q$datetime <- strptime(paste(q$Date, q$Time), "%d/%m/%Y %H:%M:%S")
  plot(q$datetime, q$Sub_metering_1, type="l", main = "", xlab = "", ylab = "Energy sub metering")
  lines(q$datetime, q$Sub_metering_2, col = rgb(1,0,0))
  lines(q$datetime, q$Sub_metering_3, col = rgb(0,0,1))
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, bty = "n" , col = c(rgb(0,0,0),rgb(1,0,0),rgb(0,0,1)))
  
  
  
  plot(q$datetime, q$Voltage, type="l", main = "", xlab = "datetime", ylab = "Voltage")
  
  plot(q$datetime, q$Global_reactive_power, type="l", main = "", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()  
}
