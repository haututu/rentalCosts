library(ggplot2)
library(plotly)

ggplotly(ggplot(filter(rentData, year(Month) > 2008), aes(as.Date(Month), mean, group=area, color=area)) +
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