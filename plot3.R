
rm(list=ls())

## please, note that subset.txt is created by 'subsetData.R'

D = read.csv("subset.txt", sep=";", header = FALSE, na.strings = "?", stringsAsFactor = FALSE)

t = strptime(paste(D[,1],D[,2]), "%d/%m/%Y %H:%M:%S", tz = "PDT")

df = cbind(t,D[3:9]) 

names(df)<-c("Time", "Active","Reactive","Voltage","Intensity","Sub1","Sub2", "Sub3")

png(filename = "plot3.png", width = 480, height = 480)

par(mfrow=c(1,1))

plot (df$Time,
      df$Sub1, 
      t = 'l', 
      xlab= "", 
      ylab = "Energy sub metering", 
      ylim=c(0,40))

lines(df$Time,df$Sub2,col = "red")

lines(df$Time,df$Sub3,col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lwd = c(1,1,1))

dev.off()
