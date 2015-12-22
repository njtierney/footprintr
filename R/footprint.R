#' footprint
#'
#' \code{footprint} does this thing
#'
#' @description footprint makes it more simple to do
#'
#' @param x a dataframe
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
