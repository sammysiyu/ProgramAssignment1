tab = read.table("household_power_consumption.txt",sep=";",header=TRUE)

time = tab$Time
date = tab$Date
cTime = paste(date,time)
oTime = strptime(cTime,"%d/%m/%Y %H:%M:%S")
chooseV = which(oTime>="2007-02-01 00:00:00" & oTime<="2007-02-03 00:00:00")

v1 = as.character(tab$Global_active_power[chooseV])
v2 = as.numeric(v1)

png("plot2.png",480,480)
plot(oTime[chooseV],v2,type='l',ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
