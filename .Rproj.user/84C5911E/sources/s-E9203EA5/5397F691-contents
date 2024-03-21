#' @title Show first lines of file without reading it in
#'
#' @description Passes 'head' function to the command line (linux).
#'
#' @param file Filename to print first lines of.
#' @param lines Number of rows to print.
#' @param separator The column delimiter of the file.
#'
#' @return Returns the first few rows of the file as a matrix.
#' @export


head_fast <- function(file, lines = 10, separator = '\t'){
  code <- paste("head -n", lines, file)
  res <- system(code, intern=TRUE)
  do.call('rbind', strsplit(res, separator))
}

