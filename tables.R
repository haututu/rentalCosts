#Loads and cleans the data
source("setup.R")

library(knitr)
library(kableExtra)

#Calculates percentage differences in rent after 2012
tableData <- filter(taMean, year(Month) > 2012) %>% 
  select(Month, area, mean) %>%
  group_by(area) %>%
  mutate(adiff = mean-lag(mean)) %>%
  mutate(pdiff = round(adiff/lag(mean)*100, 1)) %>%
  ungroup() %>%
  select(-area)

#Produces HTML which can be copied into markdown document
kable(tableData,
      col.names = c("", "Average(\\$)", "Change(\\$)", "Percent change (%)"),
      "html"
) %>%
  kable_styling(
    bootstrap_options = c("striped", "hover"), 
    full_width = FALSE
  ) %>%
  group_rows("Wellington", 1, 5) %>%
  group_rows("Dunedin", 6, 10)
