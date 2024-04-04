#### Preamble ####
# Purpose: Cleans the raw NFL data and extract QB positions in 2023 (first nine weeks)
# Author: Hyungsoo Park
# Date: 2 April 2024
# Contact: hyungsoo.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA

#### Workspace setup ####
library(tidyverse)

# read raw data
raw_data <- read_csv("data/raw_data/raw_data.csv")

#### Clean data ####
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(player_id, season, week, completions, attempts, passing_yards, passing_tds, interceptions, sacks, sack_yards, passing_epa) |>
  filter(season == 2023)|>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data,"data/analysis_data/analysis_data.csv")
