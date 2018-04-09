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
png("plot2.png", width=480, height=480)
with(data,plot(Global_active_power ~ datetime,
               type = "l",
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))
dev.off()
