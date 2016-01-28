#' viz_dat
#'
#' \code{viz_dat} visualises a data.frame to tell you what it contains.
#'
#' @description viz_dat gives you an at-a-glance picture of what is inside a dataframe. Hopefully in the future it
#'
#' @param x a dataframe
#'
#' @import tidyr
#' @import dplyr
#' @import ggplot2
#'
#' @export

viz_dat <- function(x){

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
