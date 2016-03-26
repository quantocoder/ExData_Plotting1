
rm(list=ls())

D = read.csv("subset.txt", sep=";", header = FALSE)

t = strptime(paste(D[,1],D[,2]), "%m/%d/%Y %H:%M:%S", tz = "PDT")

df = cbind(t,D[3:9]) 

names(df)<-c("Time", "Active","Reactive","Voltage","Intensity","Sub1","Sub2", "Sub3")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# 1

plot (df$Time,df$Active, t = 'l',  xlab= "", ylab = "Global ActivePower")

# 2

plot (df$Time,df$Voltage, t = 'l',  xlab= "datetime", ylab = "Voltage")

# 3

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


# 4
plot (df$Time,df$Reactive, t = 'l',  xlab= "datetime", ylab = "Global_reactive_power")

dev.off()
