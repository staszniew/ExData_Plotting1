library(dplyr)

data <- read.table(file = "./explo/household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".", na.strings = "?")

cacek <- data %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(moment = paste(Date,Time)) %>%
  select(moment, 3:9)

cacek$moment <- strptime(cacek$moment, "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")
with(cacek, plot(moment, Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)", main = ""))
dev.off()
