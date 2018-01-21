library(dplyr)
library(tidyr)
library(lubridate)

#Imports subset of columns from datasets
importData <- function(dir, area="TA", mth=11, measure) {
  
  if (area == "TA") {
    names <- c("Month", "Wellington", "Dunedin", "Tauranga.District")
  }
  
  filter(read.csv(dir),
         month(Month) == mth) %>%
    select(names) #%>%
    #Commented gather out as measure did not want to evaluate so I gave up
    #gather("area", measure, 2:4)
    
}

#Import data, extra gather is because of a NSE problem in the function
taLodge <-  importData("ta/Bonds Lodged by TA.csv", measure="lodge") %>%
  gather("area", "lodge", 2:3)
taMean  <-  importData("ta/Geometric Mean Rents by TA.csv", measure="mean") %>%
  gather("area", "mean", 2:3)
taLow   <-  importData("ta/Synthetic Lower Quartile Rents by TA.csv", measure="quartLow") %>%
  gather("area", "quartLow", 2:3)
taHigh  <-  importData("ta/Synthetic Upper Quartile Rents by TA.csv", measure="quartHigh") %>%
  gather("area", "quartHigh", 2:3)

#Join all measures
rentData <- plyr::join_all(list(taLodge, taMean, taLow, taHigh), by=c("Month", "area"), type="full")
