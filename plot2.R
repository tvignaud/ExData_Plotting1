# the script should be run from the folder containing the household_power_consumption
# the output png file will be saved in the same directory

# read the data, convert date to date, and create a datetime function with date and time together
data <- read.csv2("household_power_consumption.txt",na.strings="?",header = TRUE,dec=".",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$datetime <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# keep only data from 01/02/2007 and 02/02/2007
data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

png("plot2.png",width = 480,height=480)
with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()

# sorry for the labels of the x axis, I'm french so in my system language:
## thu -> jeu
## fri -> ven
## sat -> sam