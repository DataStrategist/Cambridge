### Providing function motivation

hospital1_data <- data.frame(
  name = c("Toby", "John", "Dorothy"),
  age = c(12,15,13),
  cancer = c("renal", "brain", "kidney"),
  gender = c("M", "M", "F")
)

hospital2_data <- data.frame(
  name = c("Kate", "Faima", "Connor"),
  sex = c("Female", "Female", "didn't say"),
  dx = c("RENAL", "KIDNEY", "APPENDIX"),
  DOB = c("1978/09/10", "1985/12/12", "1960/4/12")
)


# get age, sex and cancer type of each -----------------------------------------

library(tidyverse)

hospital1_data <- hospital1_data %>% 
  select(cancer, sex = gender, age)

hospital2_data <-
  hospital2_data %>% 
  mutate(age = as.numeric((Sys.Date() - as.Date(DOB))/365.25)) %>% 
  select(cancer = dx, sex, age) %>% 
  mutate(cancer = tolower(cancer))

bind_rows(hospital1_data, hospital2_data)

## ugh... 


## Define function
magic <- function(data){
  if ("gender" %in% names(data)) names(data)[names(data)=="gender"] <- "sex"
  if ("dx" %in% names(data)) names(data)[names(data)=="dx"] <- "cancer"
  if ("DOB" %in% names(data)) data$age <- 
      as.numeric((Sys.Date() - as.Date(data$DOB))/365.25)
  data$cancer <- tolower(data$cancer)
  
  return(select(data, cancer, sex, age))
}

## Use function
magic(hospital1_data)
magic(hospital2_data)


# Ways to run functions: --------------------------------------------------

## 1. one by one
magic(hospital1_data)
magic(hospital2_data)

## 2. for loop
fileList <- list(hospital1_data,hospital2_data)

for (i in fileList){
  print(magic(i))
}

## 3. purrr::map
fileList %>% map(~magic(.))

## 4. furrr::map
#(you're on your own! :) :) )