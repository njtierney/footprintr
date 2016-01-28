#' ggplot_missing
#' \code{ggplot_missing} displays missingness in a geom_raster
#'
#' @description ggplot_missing is a visualisation tool for
#'
#' @param x a dataframe
#' @param cor.reorder
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#'
#' @export

vismiss <- function(x,
                    miss.clust = FALSE){

  # make a TRUE/FALSE matrix of the data, whether it is missing or not.
  x.na <- is.na(x)

  # switch for creating the missing clustering
  if (miss.clust == TRUE){

    # which variables aren't missing?
    var.complete <- which(colSums(x.na) == 0)

    # calculate the euclidean distance amongst the missing values
    d <-
      # get those variables with missingness
      x.na[ ,-var.complete] %>%
      # take the transpose
          t %>%
      # take the euclidean distance between the rows
          dist

    # take the hierarchical cluster of this distance.

    h <- hclust(d)

    # this gets the order of variables rearranged according to missingness
    the.order <- c(var.complete, c(1:ncol(x))[-var.complete][h$order])

  } else {
    the.order <- 1:ncol(x)
  }

    x.na[ , the.order] %>%
    melt %>%
    ggplot(data = .,
           aes(x = Var2,
               y = Var1)) +
    geom_raster(aes(fill = value)) +
    scale_fill_grey(name = "",
                    labels = c("Present","Missing")) +
    theme_minimal() +
    theme(axis.text.x  = element_text(angle=45, vjust=0.5)) +
    labs(x = "Variables in Dataset",
         y = "Rows / observations")

}
