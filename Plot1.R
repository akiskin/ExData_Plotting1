plot1 <- function() {
  require(data.table)
  
  Sys.setlocale("LC_TIME", "us_US")
  
  data <- fread("household_power_consumption.txt", na.strings=c("?","N/A",""))
  
  
  q <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007")]

  q$Global_active_power <- as.numeric(q$Global_active_power)
  
  png("plot1.png")
  
  hist(q$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = rgb(1,0,0))
  
  dev.off()
}