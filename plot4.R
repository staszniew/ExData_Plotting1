library(dplyr)

data <- read.table(file = "./explo/household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".", na.strings = "?")

cacek <- data %>%
         filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
         mutate(moment = paste(Date,Time)) %>%
         select(moment, 3:9)

cacek$moment <- strptime(cacek$moment, "%d/%m/%Y %H:%M:%S")



png(filename = "plot4.png")

par(mfrow = c(2,2), mar = c(4,4,2,2))
# first graph
with(cacek, plot(moment, Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power", main = ""))

# second graph
with(cacek, plot(moment, Voltage, type = "l",  xlab = "datetime", ylab = "Voltage", main = ""))

# third graph
with(cacek, plot(moment, Sub_metering_1, type = "l",  xlab = "", ylab = "Energy sub metering", main = ""))
with(cacek, lines(moment, Sub_metering_2,, col = "red"))
with(cacek, lines(moment, Sub_metering_3,, col = "blue"))
with(cacek, legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), bty = "n"))

# fourth graph
with(cacek, plot(moment, Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reactive_power", main = ""))




dev.off()
