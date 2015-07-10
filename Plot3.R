plot3 <- function() {
  require(data.table)
  
  Sys.setlocale("LC_TIME", "us_US")
  
  data <- fread("household_power_consumption.txt", na.strings=c("?","N/A",""),data.table = FALSE)
  q <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
  
  #q <- as.data.frame(q)
  q$Sub_metering_1 <- as.numeric(q$Sub_metering_1)
  
  q$datetime <- strptime(paste(q$Date, q$Time), "%d/%m/%Y %H:%M:%S")
  
  png("plot3.png")
  
  
  plot(q$datetime, q$Sub_metering_1, type="l", main = "", xlab = "", ylab = "Energy sub metering")
  lines(q$datetime, q$Sub_metering_2, col = rgb(1,0,0))
  lines(q$datetime, q$Sub_metering_3, col = rgb(0,0,1))

  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1 , col = c(rgb(0,0,0),rgb(1,0,0),rgb(0,0,1)))
  dev.off()  
}