library(ggplot2)
library(plotly)

#Plot for december months, geometric mean
meanDecPlot <-      ggplotly(ggplot(filter(rentData, year(Month) > 2008), aes(as.Date(Month), mean, group=area, color=area)) +
                               geom_point() +
                               geom_line() +
                               theme_classic() +
                               theme(
                                 plot.background = element_rect(fill = "#ecf0f1"), 
                                 panel.background = element_rect(fill = "#ecf0f1"),
                                 legend.background = element_rect(fill = "#ecf0f1")
                               ) +
                               labs(
                                 title="Average rent",
                                 y="Geometric mean",
                                 x="Year",
                                 color="City"
                               ),
                             tooltip=c("mean")
                             )

#Plot for december months, lower quartile
ggplotly(ggplot(filter(rentData, year(Month) > 2008), aes(as.Date(Month), quartLow, group=area, color=area)) +
           geom_point() +
           geom_line() +
           theme_classic() +
           labs(
             title="Average rent",
             y="Geometric mean",
             x="Year",
             color="City"
           )
)

#Plot for december months, lower quartile
ggplotly(ggplot(filter(rentData, year(Month) > 2008), aes(as.Date(Month), lodge, group=area, color=area)) +
           geom_point() +
           geom_line() +
           theme_classic() +
           labs(
             title="Average rent",
             y="Geometric mean",
             x="Year",
             color="City"
           )
)