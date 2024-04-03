#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

# read raw data
raw_data <- read_csv("data/raw_data/raw_data.csv")

#### Clean data ####
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(player_id, season, week, completions, attempts, passing_epa) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data,"outputs/data/analysis_data/analysis_data.csv")
