#' @title Subset a file by a logical condition on a column
#'
#' @description Returns the subset of a file matching a given logical condition as a matrix (with awk in linux).
#'
#' @param file Filename to retrieve subset of.
#' @param column Column to apply logical condition to.
#' @param condition Logical condition to apply.
#' @param separator The column delimiter of the file.
#'
#' @return Returns a subset of a file based on the condition.
#' @export

subset_condition <- function(file, column = 10, condition = '< 5e-8', separator = '\t'){
  stt <- Sys.time()
  code <- paste0("cat ", file,"| awk 'NR==1 || $",column, condition," {print}'")
  print(code)
  res <- system(code, intern=TRUE)
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  do.call('rbind', strsplit(res, separator))
}

