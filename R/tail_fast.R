#' @title Show last lines of file without reading it in
#'
#' @description Passes 'tail' function to the command line (linux).
#'
#' @param file Filename to print last lines of.
#' @param lines Number of rows to print.
#' @param separator The column delimiter of the file.
#'
#' @return Returns the last few rows of the file as a matrix.
#' @export

tail_fast <- function(file, lines = 10, separator = '\t'){
  code <- paste("tail -n", lines, file)
  res <- system(code, intern=TRUE)
  do.call('rbind', strsplit(res, separator))
}

