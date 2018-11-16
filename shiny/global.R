# Import relevant libraries ----
library(chron)
library(data.table)
library(dplyr)
library(DT)
library(shiny)
library(shinythemes)
library(tidyverse)
library(weathermetrics)
library(ggplot2)
library(stringr)
library(tools)

# Define text for 'ReadMe' tab ----
html_text <- '<small><br>This application showcases the nut consumption of eurasian red squirrels <a href="https://en.wikipedia.org/wiki/Red_squirrel">(Sciurus vulgaris)</a> at The Squirrel Cafe in Ahrensburg, Germany.<br/><br>Physicist and squirrel gastronomer Carsten Dannat is trying to correlate two critical social economical factors: how many summer days do we have left, and when will we run out of nuts. His research project, the Squirrel Cafe, invites squirrels to grab some free nuts and collects interesting bits of customer data in return. Dannat is trying to prove the amount of nuts taken by eurasian red squirrels from a feeder correlates with upcoming winter weather conditions significantly. To prove this, Dannat regularly fills a wooden squirrel feeder with a known amount of nuts. A mercury switch on the feeder’s lid triggers the execution of a Python script on a Raspberry Pi. The script then polls a Dallas DS18B20 temperature sensor and takes a photograph through a Raspberry Pi camera module. All gathered data is automatically compiled into a <a href="https://twitter.com/iotSensorius">tweet</a>, sent to <a href="https://thingspeak.com/">ThingSpeak</a> for further processing, and made available for download at <a href="https://www.thesquirrelcafe.com">The Squirrel Cafe</a>.<br/><hr>The <b>Plot</b> tab illustrates a scatterplot of data collection results across a number of dimensions for which nut count and nut consumption has been collected (440 data points out of 84,318 data points), and the sidebar contains options with which to filter the collected data. <br><br>Additionally, the:</br><ul><li><b>Data</b> tab lists the raw data in tabular form.</li><li><b>Data Dictionary</b> tab defines the contents of the data in tabular form.</li></ul><hr>This project was completed by <a href="https://github.com/kotanna">Anna M. Kot</a> at University of New Hampshire for DATA901: Analytics Applications I (Fall 2018).</small>'

# Read data ----
data <- fread("data.csv")
dataDict <- fread("dataDict.csv")
