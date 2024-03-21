#' @title Subset a file based on grepping
#'
#' @description Retrieves a subset of a file based on grepping for a pattern (using grep/awk in linux).
#'
#' @param file Filename to grep in.
#' @param column Column to apply the grep to.
#' @param pattern A regular expression.
#' @param separator The column delimiter of the file.
#' @param grep If FALSE, does not grep but exactly matches the pattern.
#' @param first_row If TRUE, returns first row as well.
#'
#' @return Returns a subset of a file as a matrix.
#' @export

subset_grep <- function(file, column = 1, pattern = NULL, separator = '\t', grep = TRUE, first_row = TRUE){
  stt <- Sys.time()
  code <- paste0("grep -nE \"", pattern,"\" ", file," | awk -F: '{print $1}' | xargs -I {} awk 'NR == {}' ", file)
  if(grep == FALSE) code <- paste0("awk '/", pattern, "/ {print} ", file)
  print(substr(code, 1, 50))
  res <- system(code, intern=TRUE)
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  res <- do.call('rbind', strsplit(res, separator))
  if(first_row) rbind(colnames_fast(file, separator), res)
  else res
}

