library(dplyr)
library(tidyr)
library(readr)

# Read only needed columns: Id, date, and value
sleep <- read_csv("minuteSleep_merged.csv", 
                  col_types = cols(
                    Id = col_character(),
                    date = col_date(format="%m/%d/%Y"),
                    value = col_character()
                  )) %>%
  select(Id, date, value)   # drop unnecessary columns immediately

# Summarize daily sleep by stage
daily_sleep <- sleep %>%
  group_by(Id, date, value) %>%
  summarise(minutes = n(), .groups = "drop") %>%
  pivot_wider(names_from = value, values_from = minutes, values_fill = 0) %>%
  rename(
    Light = `1`,
    Deep  = `2`,
    REM   = `3`
  ) %>%
  mutate(TotalSleep = Light + Deep + REM) %>%
  filter(TotalSleep <= 1440) %>%
  distinct(Id, date, .keep_all = TRUE)

# Save smaller cleaned dataset
write_csv(daily_sleep, "minuteSleep_merged_cleaned.csv")
