here::i_am("sessions/session_06/make_happiness_data.R")
library(here)
library(dplyr)
library(here)
library(openxlsx)
library(WDI)
library(countrycode)
library(readr)

whr_data <- read.xlsx(
  xlsxFile = here("sessions/session_06/data/WHR26_Data.xlsx"), 
  cols = c(1,3,4)) |> 
  rename(year=Year, country=`Country.name`, 
         happiness = `Life.evaluation.(3-year.average)`)

whr_countries <- countrycode(unique(whr_data$country), "country.name", "iso2c")
whr_countries <- whr_countries[!is.na(whr_countries)]
whr_years <- c(min(whr_data$year), max(whr_data$year))

gdp_data <- WDI::WDI(
  #country = whr_countries, 
  #start = whr_years[1], end = whr_years[2], 
  indicator = c(
    "NY.GDP.MKTP.PP.KD",
    "SP.POP.TOTL",
    "SL.UEM.TOTL.ZS"
    )) |> 
  rename(
    GDP_ppp=`NY.GDP.MKTP.PP.KD`,
    population=`SP.POP.TOTL`,
    unemployment=`SL.UEM.TOTL.ZS`) |> 
  mutate(
    GDP_pc = GDP_ppp/population
  ) 

gini_data <- read_csv(
  file = here("sessions/session_06/data/swiid9_92_summary.csv"), 
  col_select = c("country", "year", "gini_disp"))

happiness_income_data <- dplyr::inner_join(
  x = gdp_data, y = whr_data, by = c("country", "year")) |> 
  left_join(y = gini_data, by = c("country", "year"))

write_csv(happiness_income_data, 
          file = here("sessions/session_06/data/happiness_income.csv"))
