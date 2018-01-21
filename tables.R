library(knitr)

kable(filter(rentData, year(Month) > 2008) %>% 
        select(Month, area, mean) %>%
        mutate(adiff = mean-lag(mean)) %>%
        mutate(pdiff = adiff/lag(mean)*100),
      "html") %>%
  
filter(rentData, year(Month) > 2008) %>% 
  select(Month, area, quartLow) %>%
  mutate(adiff = quartLow-lag(quartLow)) %>%
  mutate(pdiff = adiff/lag(quartLow)*100)