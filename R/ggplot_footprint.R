#' ggplot_footprint
#'
#' \code{ggplot_footprint} Creates a ggplot plot of a dataframe, displaying missing data, and variable classes as different colours.
#'
#' @description ggplot_footprint assists in the exploratory visualisation process of data.
#'
#' @param x a dataframe
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#'
#' @export

ggplot_footprint <- function(x){

  # apply the footprint to every column in the dataframe
  lapply(x, footprint) %>%
    # coerce it to a dataframe...there's probably a better way
    as_data_frame %>%
    # create a new column that is numbered from 1 to the number of rows
    mutate(rows = 1:n()) %>%
    # gather the variables together for plotting
    # here we now have a column of the row number (row), then the variable(variables), then the contents of that variable (value)
    gather(key = variables,
           value = value,
           -rows) %>%
    # then we plot it
    ggplot(data = .,
           aes(x = variables,
               y = rows)) +
    geom_raster(aes(fill = value)) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5)) +
    labs(x = "Variables in Dataset",
         y = "Rows / observations")
}
