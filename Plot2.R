plot2 <- function() {
  require(data.table)
  
  Sys.setlocale("LC_TIME", "us_US")
  
  #data <- read.csv("household_power_consumption.txt", sep = ";")
  data <- fread("household_power_consumption.txt", na.strings=c("?","N/A",""),data.table = FALSE)
  

  q <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
  #q <- as.data.frame(q)
  
  #Construct real time object
  q$datetime <- strptime(paste(q$Date, q$Time), "%d/%m/%Y %H:%M:%S")
  #q$dayofweek <- format(q$datetime, "%a")
  
  png("plot2.png")
  
  plot(q$datetime, q$Global_active_power, type="l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()  
}