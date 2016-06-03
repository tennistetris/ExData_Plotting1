for (char in c("dplyr" , "lubridate")){
  library(char , character.only = TRUE  ,quietly = TRUE)
}

db =read.table("household_power_consumption.txt" , sep = ";" , stringsAsFactors = FALSE , header = TRUE , na.strings = "?")
db = mutate(db , Date = dmy(Date) , Time = hms(Time))
db = subset(db , Date == "2007-02-01" | Date == "2007-02-02")
db$Date = db$Date +db$Time
db$Time = NULL


# PLOT 4

png("Plot4.png")

par(mfcol = c(2,2) , mar = c(4,4,2,2))

plot(db$Date , db$Global_active_power,type = 'n' ,  ylab = "Global Active Power(kilowatts)" , xlab = "")
lines(db$Date , db$Global_active_power)

plot(db$Date , db$Sub_metering_1 ,type = "n" , ylab = "Energy sub metering" , xlab = "")
lines(db$Date ,db$Sub_metering_1)
lines(db$Date , db$Sub_metering_2 , col = "red")
lines(db$Date , db$Sub_metering_3 , col = "blue")
legend("topright"  , col = c("black" , "red" , "blue") ,pch = "___", legend = c("Sub_Metering_1" , "Sub_Metering_2" , "Sub_Metering_3"))


plot(db$Date , db$Voltage , xlab = "datetime" , ylab = "Volatge" , type = "n")
lines(db$Date , db$Voltage)

plot(db$Date , db$Global_reactive_power , ylab = "Global_Reactive_Power" , xlab = "datetime" , type = "n")
lines(db$Date , db$Global_reactive_power)


dev.off()
