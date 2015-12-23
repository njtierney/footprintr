#' footprint
#'
#' \code{footprint} is a utility function for ggplot_footprint
#'
#' @description footprint very simply replaces the contents with the class of a given object, unless it is missing (coded as NA), in which case it leaves it as NA
#'
#' @param x a list, a row, or a column.
#'
#'
#' @export
footprint <- function(x){
  # is the data missing?
    ifelse(is.na(x),
           # yes? Leave as is NA
           yes = NA,
           # no? make that value no equal to the class of this cell.
           no = class(x))

}
