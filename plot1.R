tab = read.table("household_power_consumption.txt",sep=";",header=TRUE)

time = tab$Time
date = tab$Date
cTime = paste(date,time)
oTime = strptime(cTime,"%d/%m/%Y %H:%M:%S")
wTime = as.Date(oTime)
chooseV = which(wTime>="2007-02-01" & wTime<="2007-02-02")

v1 = as.character(tab$Global_active_power[chooseV])
v2 = as.numeric(v1)
v3 = v2[complete.cases(v2)]

png("plot1.png",480,480)
hist(v3,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
