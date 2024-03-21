#' @title Create a new column by combining two existing columns
#'
#' @description Returns a combined set of columns as one column, or the original file with the combined column appended.
#'
#' @param file Filename.
#' @param column_1 Column 1 to be combined (left side).
#' @param column_2 Column 2 to be combined (right side).
#' @combination_symbol Symbol that separates the two columns after combining.
#' @param separator The column delimiter of the file.
#' @param add_to_file If TRUE, appends the new column to the file before returning the file.
#'
#' @return Returns either the new column or the file as matrix, with new column appended.
#' @export

combine_columns <- function(file, column_1 = 1, column_2 = 2, combination_symbol = ':', separator = '\t', add_to_file = TRUE){
  stt <- Sys.time()
  code <- paste0("awk '{print $0 \"", separator, "\" $", column_1, " \"", combination_symbol,"\" $", column_2, "}' ", file)
  if(add_to_file){
    code <- paste0(code, "> temp.txt")
    code2 <- paste0("paste -d ", file, " temp.txt >", file)
    print(code)
    system(code)
    print(code2)
    system(code2)
    system('rm temp.txt')
    ett <- Sys.time()
    print(difftime(ett, stt, units='secs'))
  }
  else{
    print(code)
    res <- system(code, intern=TRUE)
    ett <- Sys.time()
    print(difftime(ett, stt, units='secs'))
    do.call('rbind', strsplit(res, separator))
  }
}
