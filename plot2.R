
rm(list=ls())

## please, note that subset.txt is created by 'subsetData.R'

D = read.csv("subset.txt", sep=";", header = FALSE, na.strings = "?", stringsAsFactor = FALSE)

t = strptime(paste(D[,1],D[,2]), "%d/%m/%Y %H:%M:%S", tz = "PDT")

df = cbind(t,D[3:9]) 

names(df)<-c("Time", "Active","Reactive","Voltage","Intensity","Sub1","Sub2", "Sub3")

png(filename = "plot2.png", width = 480, height = 480)

par(mfrow=c(1,1))

plot(df$Time,df$Active, t = 'l',
     xlab="",
     ylab = "Global Active Power (kilowatts)")

dev.off()
