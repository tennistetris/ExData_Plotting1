for (char in c("dplyr" , "lubridate")){
  library(char , character.only = TRUE  ,quietly = TRUE)
}

db =read.table("household_power_consumption.txt" , sep = ";" , stringsAsFactors = FALSE , header = TRUE , na.strings = "?")
db = mutate(db , Date = dmy(Date) , Time = hms(Time))
db = subset(db , Date == "2007-02-01" | Date == "2007-02-02")
db$Date = db$Date +db$Time
db$Time = NULL


# PLOT 2
png("Plot2.png")
plot(db$Date , db$Global_active_power,type = 'n' ,  ylab = "Global Active Power(kilowatts)" , xlab = "")
lines(db$Date , db$Global_active_power)
dev.off()