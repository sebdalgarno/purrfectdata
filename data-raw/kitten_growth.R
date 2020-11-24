## code to prepare `kitten_growth` dataset goes here
library(readr)
library(dplyr)
library(glue)

tz <- "Etc/GMT+8"
kitten_growth <- read_csv("~/OneDrive - UNBC/Data/studyhall/Kitten Tracking.csv")
kitten_growth <- kitten_growth %>%
  rename_all(function(x){
    tolower(gsub(" ", "_", x))
    }) %>%
  rename(kitten_id = `kitten#`) %>%
  mutate(name = if_else(name == ".", NA_character_, name),
         date = parse_date(glue("2020-{date}"), "%Y-%d-%b"),
         datetime = readr::parse_datetime(glue("{date} {time}")),
         date = NULL,
         time = NULL)

usethis::use_data(kitten_growth, overwrite = TRUE)
