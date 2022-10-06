# R version 4.2.1 (2022-06-23 ucrt) -- "Funny-Looking Kid"
# Copyright (C) 2022 The R Foundation for Statistical Computing
# Platform: x86_64-w64-mingw32/x64 (64-bit)

# M. Bravo

# Exploratory Data Analysis Week 1 Project

# plot3.R

# read and select the data for 2007-02-01 and 2007-02-02
# convert Date and Time to date and time R class

hpc <- read.table("./household_power_consumption.txt",
                  header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date( hpc$Date,format="%d/%m/%Y")
hpc <- hpc[ hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Time <- strptime( paste( hpc$Date, hpc$Time), format= "%Y-%m-%d %H:%M:%S")

# open png device

png( file = "./plot3.png")

# Creates the 3 layer graph

# Creates plot of date/time v Sub metering 1 

plot(hpc$Time, hpc$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")

# Adds line graph for date/time v Sub metering 2 in red

lines(hpc$Time, hpc$Sub_metering_2, type = "l", col = "red" )

# Adds line graph for date/time v Sub metering 3 in blue

lines(hpc$Time, hpc$Sub_metering_3, type = "l", col = "blue" )

# Adds legend

legend("topright", lty= 1, col = c("Black", "red", "blue"), 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )


# close png device

dev.off()
