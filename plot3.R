tab = read.table("household_power_consumption.txt",sep=";",header=TRUE)

time = tab$Time
date = tab$Date
cTime = paste(date,time)
oTime = strptime(cTime,"%d/%m/%Y %H:%M:%S")
chooseV = which(oTime>="2007-02-01 00:00:00" & oTime<="2007-02-03 00:00:00")
tTime = oTime[chooseV]

s1 = as.numeric(as.character(tab$Sub_metering_1[chooseV]))
s2 = as.numeric(as.character(tab$Sub_metering_2[chooseV]))
s3 = as.numeric(as.character(tab$Sub_metering_3[chooseV]))

png("plot3.png",480,480)
plot(tTime,s1,type='l', ylab="Energy sub metering",xlab="")
lines(tTime,s2,col="red")
lines(tTime,s3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
