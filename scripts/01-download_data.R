#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(nflverse)
library(arrow)

#### Download data and save ####
qb_regular_season_stats <- 
  load_player_stats(seasons = TRUE) |> 
  filter(season_type == "REG" & position == "QB")
# wrtie parquet file
write_parquet(qb_regular_season_stats, "data/raw_data/raw_data.parquet")
raw_parquet <- read_parquet("data/raw_data/raw_data.parquet")
# convert parquet file to csv file
write_csv(raw_parquet, "data/raw_data/raw_data.csv")

