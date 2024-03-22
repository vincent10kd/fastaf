#' @title Randomly sample rows from a file without first loading it
#'
#' @description Returns a random subset of arbitrary size from a file (using awk and shuf in linux).
#'
#' @param file Filename to retrieve rows from.
#' @param no_of_rows Number of rows to sample.
#' @param exclude_condition Rows not matching the condition will not be sampled from.
#' @param exclude_condition_col Column to which the exclusion condition should be applied.
#' @param separator The column delimiter of the file.
#'
#' @return Returns a random subset of specified size from a file as a matrix.
#' @export

sample_rows <- function(file, no_of_rows = 10, exclude_condition = NULL, exclude_condition_col = 1, separator = '\t'){
  stt <- Sys.time()
  code <- paste0("awk 'NR==1 || $", exclude_condition_col, exclude_condition,"' ", file,"| shuf -n ", sprintf("%.0f", no_of_rows))
  if(is.null(exclude_condition))   code <- paste0("shuf -n ", sprintf("%.0f", no_of_rows)," ",file)
  print(code)
  res <- system(code, intern=TRUE)
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  do.call('rbind', strsplit(res, separator))
}

