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

#Create chart and save as png
png("plot1.png", width=480, height=480)
with(data,
     hist(Global_active_power,
          col = "red",
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power"))
dev.off()