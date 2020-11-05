#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Qiyu Huang & Yuhan Zhu 
# Data: 22 October 2020
# Contact: cybernavily.huang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####
library(haven)
library(tidyverse)
library(dplyr)
# Read in the raw data.
setwd("C:/Users/12069/Desktop/heixiannv")
raw_data <- read.csv("usa_00004.csv")

reduced_data <- 
  raw_data %>% 
  dplyr::select(SEX, AGE)

reduced_data$gender = str_replace_all(reduced_data$SEX,"1","Male")
reduced_data$gender = str_replace_all(reduced_data$gender,"2","Female")

names(reduced_data)[2] <- "age"
reduced_data <- 
  reduced_data %>% 
  dplyr::select(age, gender)

# Saving the census data as a csv file in my
# working directory
write_csv(reduced_data, "census_data.csv")



         