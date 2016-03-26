
url ="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url,"household_power_consumption.zip")

system("unzip -u household_power_consumption.zip")

system ("grep '^\\(1/2/2007\\|2/2/2007\\)' household_power_consumption.txt  > subset.txt")
