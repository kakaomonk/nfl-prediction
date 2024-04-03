#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(poissonreg)
library(tidymodels)
library(tidyverse)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

#### Set Period ####
period_data <- analysis_data |>
  filter(week < 10)

### Model data ####
first_9_weeks_passing_model_2023 <-
  linear_reg() |>
  set_engine(engine = "lm") |>
  fit(
    passing_epa ~ completions + attempts + passing_yards + passing_tds + interceptions + sacks + sack_yards,
    data = period_data
  )
#### Save model ####
saveRDS(
  first_9_weeks_passing_model_2023,
  file = "models/first_9_weeks_passing_model_2023.rds"
)


