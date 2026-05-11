# prepare_data.R
# Creates the two dataset versions for Session 4 from the hotels-europe source.
#
# Run this script once from the session_04/ directory before rendering slides or demo.
#
# Output:
#   data/hotels_cs.csv    — cross-section: November 2017, 8 selected cities
#   data/hotels_panel.csv — panel: all 8 dates, same 8 cities (autocorrelation demo only)

library(tidyverse)

raw <- read_csv(
  "../../../Assignments/AdvancedDataScience26-Task2/hotels-europe.csv",
  show_col_types = FALSE
)

cities_selected <- c(
  "Istanbul", "Budapest", "Prague",
  "Vienna", "Barcelona", "Amsterdam",
  "Paris", "London"
)

# Cross-section: one point in time, variation across hotels and cities
# Drop rows with missing values in the key analysis variables so model and
# augment() always produce the same number of rows.
hotels_cs <- raw |>
  filter(year == 2017, month == 11, city %in% cities_selected) |>
  select(hotel_id, city, distance, stars, rating, accommodation_type, price) |>
  drop_na(distance, stars, price)

write_csv(hotels_cs, "data/hotels_cs.csv")
cat("Cross-section written:", nrow(hotels_cs), "observations,", n_distinct(hotels_cs$city), "cities\n")

# Panel: all 8 dates, same cities — used only for autocorrelation illustration
hotels_panel <- raw |>
  filter(city %in% cities_selected) |>
  select(hotel_id, city, distance, stars, rating, accommodation_type, year, month, weekend, price)

write_csv(hotels_panel, "data/hotels_panel.csv")
cat("Panel written:", nrow(hotels_panel), "observations,", n_distinct(hotels_panel$city), "cities,",
    n_distinct(paste(hotels_panel$year, hotels_panel$month)), "time points\n")
