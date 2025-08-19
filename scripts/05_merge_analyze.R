# Load libraries
library(dplyr)
library(ggplot2)
library(readr)

##############################################
## 1. Load cleaned datasets ##
##############################################

# Load daily_sleep (already cleaned in R earlier)
daily_sleep <- read_csv("minuteSleep_merged_cleaned.csv")

# Load daily_activity (cleaned manually in Excel)
daily_activity <- read_csv("dailyActivity_cleaned.csv") %>%
  rename(
    date = `Activity Date`,
    TotalSteps = `Total Steps`,
    TotalDistance = `Total Distance`,
    SedentaryMinutes = `Sedentary Minutes`
  )


##############################################
## 2. Explore daily_sleep ##
##############################################

# Unique participants
n_distinct(daily_sleep$Id)

# Number of observations
nrow(daily_sleep)

# Summary statistics
daily_sleep %>%
  select(Light, Deep, REM, TotalSleep) %>%
  summary()

# Plot distribution of total sleep
ggplot(daily_sleep, aes(x = TotalSleep)) +
  geom_histogram(binwidth = 30, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Total Sleep per Day",
       x = "Total Sleep (minutes)",
       y = "Count of Days")


##############################################
## 3. Explore daily_activity ##
##############################################

# Unique participants
n_distinct(daily_activity$Id)

# Number of observations
nrow(daily_activity)

# Summary statistics
daily_activity %>%
  select(TotalSteps, TotalDistance, SedentaryMinutes) %>%
  summary()


##############################################
## 4. Merge datasets for combined analysis ##
##############################################
#make sure both dataframes have the same type:
# Example: df1 and df2 are the two datasets
daily_sleep$date <- as.Date(daily_sleep$date, format = "%m/%d/%Y")
daily_activity$date <- as.Date(daily_activity$date, format = "%m/%d/%Y")
# Now merge
merged <- merge(daily_sleep, daily_activity, by = c("Id", "date"))

# Merge by Id and Date
combined_data <- merge(daily_sleep, daily_activity, by = c("Id", "date"))

# Unique participants after merging
n_distinct(combined_data$Id)

# Explore relationship: Total Sleep vs Total Steps
ggplot(combined_data, aes(x = TotalSleep, y = TotalSteps)) +
  geom_point(alpha = 0.6, color = "darkgreen") +
  labs(title = "Total Sleep vs Total Steps",
       x = "Total Sleep (minutes)",
       y = "Total Steps")

# Explore relationship: Sedentary Minutes vs Total Sleep
ggplot(combined_data, aes(x = SedentaryMinutes, y = TotalSleep)) +
  geom_point(alpha = 0.6, color = "red") +
  labs(title = "Sedentary Minutes vs Total Sleep",
       x = "Sedentary Minutes",
       y = "Total Sleep (minutes)")


