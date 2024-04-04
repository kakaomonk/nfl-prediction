#### Preamble ####
# Purpose: Downloads and saves the data from NFL database
# Author: Hyungsoo Park
# Date: 02 April 2024
# Contact: Hyungsoo Park
# License: MIT
# Pre-requisites: NA

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

