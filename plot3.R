#read data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

#convert Date from character to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset data to only 2007-02-01 to 2001-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#Combine Date and Time colums into one column as class POSIXct
data$datetime <- as.POSIXct(strptime(paste(as.character(data$Date), "", data$Time),
                                     "%Y-%m-%d%H:%M:%S"))

#Create chart and save as png
png("plot3.png", width=480, height=480)
with(data,
     plot(Sub_metering_1 ~ datetime,
          type = "l",
          ylab = "Energy sub metering",
          xlab = ""))
with(data,
     lines(Sub_metering_2 ~ datetime,
           col = "red"))
with(data,
     lines(Sub_metering_3 ~ datetime,
           col = "blue"))
legend("topright",
       col=c("black", "red", "blue"),
       lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()