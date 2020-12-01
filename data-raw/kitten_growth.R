## code to prepare `kitten_growth` dataset goes here
library(readr)
library(dplyr)
library(glue)

tz <- "Etc/GMT+8"
kitten_growth <- read_csv("~/OneDrive - UNBC/Data/studyhall/Kitten Tracking.csv")
kitten_growth <- kitten_growth %>%
  mutate(name = case_when(`Kitten#` == 1 ~ "Skipper",
                          `Kitten#` == 2 ~ "Badger",
                          `Kitten#` == 3 ~ "Ash",
                          `Kitten#` == 4 ~ "Minnow",
                          `Kitten#` == 5 ~ "Gizmo",
                          `Kitten#` == 6 ~ "Patch",
                          `Kitten#` == 7 ~ "Nuisance",
                          `Kitten#` == 8 ~ "Tenzing",
                          TRUE ~ NA_character_),
         Name = if_else(Name == ".", name, Name),
         name = NULL)

kitten_growth <- kitten_growth %>%
  rename_all(function(x){
    tolower(gsub(" ", "_", x))
    }) %>%
  rename(kitten_id = `kitten#`) %>%
  mutate(date = parse_date(glue("2020-{date}"), "%Y-%d-%b"),
         datetime = readr::parse_datetime(glue("{date} {time}")),
         date = NULL,
         time = NULL)

usethis::use_data(kitten_growth, overwrite = TRUE)
