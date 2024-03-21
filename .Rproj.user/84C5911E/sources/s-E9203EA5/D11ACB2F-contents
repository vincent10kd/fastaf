#' @title Retrieve column names of a file
#'
#' @description Returns the column names of a file, provided these are the first row of the file.
#'
#' @param file Filename to retrieve colnames from.
#' @param separator The column delimiter of the file.
#'
#' @return Returns the column names as a character vector.
#' @export

colnames_fast <- function(file, separator = '\t'){
  x <- head_fast(file, 1, separator)
  as.character(x)
}

