
rm(list=ls())

D = read.csv("subset.txt", sep=";", header = FALSE)

t = strptime(paste(D[,1],D[,2]), "%m/%d/%Y %H:%M:%S", tz = "PDT")

df = cbind(t,D[3:9]) 

names(df)<-c("Time", "Active","Reactive","Voltage","Intensity","Sub1","Sub2", "Sub3")

png(filename = "plot2.png", width = 480, height = 480)

par(mfrow=c(1,1))

plot(df$Time,df$Active, t = 'l',
     xlab="",
     ylab = "Global Active Power (kilowatts)")

dev.off()
