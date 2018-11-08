source("setup.R")

library(ggplot2)
library(plotly)

###Data for graphs is generated in setup.R

#Plot for december months, geometric mean
meanDecPlot <- ggplot(filter(rentData, year(Month) > 2008), aes(as.Date(Month), mean, group=area, color=area)) +
  geom_point() +
  geom_line() +
  theme_classic() +
  theme(
    plot.background = element_rect(fill = "#ecf0f1", color=NA), 
    panel.background = element_rect(fill = "#ecf0f1"),
    legend.background = element_rect(fill = "#ecf0f1"),
    plot.title = element_text(hjust = 0.5)
    ) +
  labs(
    title="Average rent for December",
    y="Geometric mean",
    x="Year",
    color="City"
    )

#Plot for december months, lower quartile
quartDecPlot <- ggplot(filter(rentData, year(Month) > 2008), aes(as.Date(Month), quartLow, group=area, color=area)) +
  geom_point() +
  geom_line() +
  theme_classic() +
  theme(
    plot.background = element_rect(fill = "#ecf0f1"), 
    panel.background = element_rect(fill = "#ecf0f1"),
    legend.background = element_rect(fill = "#ecf0f1"),
    panel.border = element_rect(color="#ecf0f1", size=0.5, linetype="solid"),
    plot.title = element_text(hjust = 0.5)
  ) +
  labs(
    title="Lower quartile rent for December",
    y="Geometric mean",
    x="Year",
    color="City"
  )

#Save the plots
ggsave("images/meanDecPlot.svg", plot=meanDecPlot, device="svg", width=7, height=5)
