#' @title Quickly sort a file and return
#'
#' @description Returns the file sorted by a column.
#'
#' @param file Filename to sort.
#' @param column Column to sort by.
#' @param descending If TRUE, sorts in descending order.
#' @param separator The column delimiter of the file.
#'
#' @return Returns the sorted file as matrix.
#' @export

sort_fast <- function(file, column = 1, descending = TRUE, separator = '\t'){
  stt <- Sys.time()
  code <- paste0("sort -t '", separator,"' -k", column,",", column," -n", ifelse(descending, 'r', '')," ", file)
  print(code)
  res <- system(code, intern=TRUE)
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  do.call('rbind', strsplit(res, separator))
}
