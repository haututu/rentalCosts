library(knitr)
library(kableExtra)

tableData <- filter(taMean, year(Month) > 2012) %>% 
  select(Month, area, mean) %>%
  group_by(area) %>%
  mutate(adiff = mean-lag(mean)) %>%
  mutate(pdiff = round(adiff/lag(mean)*100, 1)) %>%
  ungroup() %>%
  select(-area)

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