#' Rename JPG images
#'
#' Renames images according to YYYYmmdd_HHMMSS.jpg. It is better to just use the renaming function in the package 'camtrapR instead. It is better tested and also adds the station and camera column to the file name. This function I made is just for the fun of it.
#'
#' @param inDir character. The directory where your images are saved. Make sure you are working on a back up of your data in case something goes wrong.
#'
#' @author Philip Faure, \email{philip.faure13@gmail.com}
#' @keywords image rename
#'
#' @export
#'
#' @examples
#' imgRename(inDir  = "/Users/philipfaure/Photos/")

imgRename <- function (inDir)
{
time <- Sys.time()
  if (Sys.info()[["sysname"]] == "Windows") {
message(".......")
    shell(paste("exiftool -r -d %Y%m%d_%H%M%S%%-c.%%e '-filename<CreateDate'", inDir, sep = ""))
  }
else {
message(".......")
    system(paste("exiftool -r -d %Y%m%d_%H%M%S%%-c.%%e '-filename<CreateDate'", inDir, sep = ""))
  }
  comp.time <- Sys.time() - time
print(comp.time)
}
