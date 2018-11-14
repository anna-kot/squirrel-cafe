# Read and clean data ----
data <- fread("data/tsc_data.csv")

# Remove raw data frame
rm(tsc.data)

# Convert 'created_at' column into a date and time class
data$created_at <- as.POSIXct(data$created_at, tz = "UTC")

# Separate 'created_at' into date and time columns
data <- data %>%
  separate(created_at, c("created_date","created_time"), " ", fill = "right", remove = FALSE)

# Convert 'created_date' to a date class
data$created_date <- as.Date(data$created_date)

# Create a 'year', 'month', and 'weekday' column
data$created_year <- factor(year(data$created_date))
data$created_month <- factor(months(data$created_date, abbreviate= FALSE))
data$created_weekday <- factor(weekdays(data$created_date, abbreviate= FALSE))

# Create new column for time of day
data$created_time <- chron(times=data$created_time)
data <- transform(data,
                  created_period = cut(created_time,
                                       breaks = times(c("00:00:00", "06:00:00", 
                                                        "12:00:00", "18:00:00", "23:59:00")),
                                       labels = c("Night", "Morning", "Afternoon", "Evening"), 
                                       include.lowest = TRUE))

# Create a new column for converted temperature
data$temperature_converted <- celsius.to.fahrenheit(data$temperature)

# Create a trimmed version of the data set retaining only
# the columns needed for analysis and insights
data <- subset(data, select=c(2,8,9,10,11,6,12,5,7))

# Create a copy of the dataset omitting
# temperature data points with NA values
data2 <- data
data2 <- data[!is.na(data$temperature), ]

# Output a cleansed version each data frame to
# the project folder
write.csv(data,'output/data.csv', row.names = FALSE)
write.csv(data2,'output/data2.csv', row.names = FALSE)