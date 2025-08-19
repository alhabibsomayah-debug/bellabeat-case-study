# Load libraries
library(dplyr)
library(lubridate)
library(readr)

# 1. Read the data
df <- read_csv("heartrate_seconds_merged.csv")

# 2. Convert Time column to proper datetime
df <- df %>%
  mutate(Time = mdy_hms(Time))   # because format is like 4/1/2016 7:54:00 AM

# 3. Remove duplicates (if any)
df <- df %>%
  distinct()

# 4. Check for missing values
sum(is.na(df))   # should be 0 here, but good practice

# 6. Save cleaned dataset
write_csv(df, "heartrate_seconds_clean.csv")

