tab = read.table("household_power_consumption.txt",sep=";",header=TRUE)

time = tab$Time
date = tab$Date
cTime = paste(date,time)
oTime = strptime(cTime,"%d/%m/%Y %H:%M:%S")
chooseV = which(oTime>="2007-02-01 00:00:00" & oTime<="2007-02-03 00:00:00")
tTime = oTime[chooseV]

png("plot4.png",480,480)
par(mfrow = c(2,2),mar=c(6,4,4,4))

v1 = as.numeric(as.character(tab$Global_active_power[chooseV]))
plot(tTime,v1,type='l',ylab="Global Active Power",xlab="")

v2 = as.numeric(as.character(tab$Voltage[chooseV]))
plot(tTime,v2,type='l',ylab="Voltage",xlab="datetime")

s1 = as.numeric(as.character(tab$Sub_metering_1[chooseV]))
s2 = as.numeric(as.character(tab$Sub_metering_2[chooseV]))
s3 = as.numeric(as.character(tab$Sub_metering_3[chooseV]))
plot(tTime,s1,type='l', ylab="Energy sub metering",xlab="")
lines(tTime,s2,col="red")
lines(tTime,s3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.8,bty="n")

g1 = as.numeric(as.character(tab$Global_reactive_power[chooseV]))
plot(tTime,g1,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()

