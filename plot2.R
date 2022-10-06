# R version 4.2.1 (2022-06-23 ucrt) -- "Funny-Looking Kid"
# Copyright (C) 2022 The R Foundation for Statistical Computing
# Platform: x86_64-w64-mingw32/x64 (64-bit)

# M. Bravo

# Exploratory Data Analysis Week 1 Project

# plot2.R

# read and select the data for 2007-02-01 and 2007-02-02
# convert Date and Time to date and time R class

hpc <- read.table("./household_power_consumption.txt",
                  header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date( hpc$Date,format="%d/%m/%Y")
hpc <- hpc[ hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Time <- strptime( paste( hpc$Date, hpc$Time), format= "%Y-%m-%d %H:%M:%S")

# open png device

png( file = "./plot2.png")

# creates the plot graphic

plot( hpc$Time, hpc$Global_active_power, type="l", 
      xlab="", ylab="Global Active Power (kilowatts)")

# close png device

dev.off()
