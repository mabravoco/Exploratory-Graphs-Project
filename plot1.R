# R version 4.2.1 (2022-06-23 ucrt) -- "Funny-Looking Kid"
# Copyright (C) 2022 The R Foundation for Statistical Computing
# Platform: x86_64-w64-mingw32/x64 (64-bit)

# M. Bravo

# Exploratory Data Analysis Week 1 Project

# plot1.R

# read and select the data for 2007-02-01 and 2007-02-02
# convert Date and Time to date and time R class


hpc <- read.table("./household_power_consumption.txt",
                  header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date( hpc$Date,format="%d/%m/%Y")
hpc <- hpc[ hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

# Open png device

png( file = "./plot1.png")

# creates the histogram graphic

hist( hpc$Global_active_power, main="Global Active Power", 
      xlab="Global Active Power (kilowatts)",
      col="red")

# close png device

dev.off()

