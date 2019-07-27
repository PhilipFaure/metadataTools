#' Copy photos of specific species
#'
#' Copy all images from a specified directory which has a certain metadata species tag to a specified directory set by user. This function is very much similar to the 'getSpeciesImages' function from the camtrapR package except you can use Windows Live Gallery tags as well as digiKam tags.
#'
#'
#' @param inDir character. The directory where all the images are saved in.
#' @param newDir character. The directory where you would like to copy your images to.
#' @param exifTag character. The name of the species tag column. Use "Subject" for images tagged in Windows Live Gallery or and in digiKam. Other tags might be necessary for images tagged in different software. You can use the metadata function to look for different tag names.
#' @param species character. The species tag as tagged in DigiKam or Windows Live Gallery.
#' @return Copies all images according to the specified arguments (species, year) to a new directory as chosen by the user.
#'
#' @export
#'
#' @author Philip Faure, \email{philip.faure13@gmail.com}
#' @keywords Copy species
#'
#'
#' @examples
#' copySpByYear(inDir   = "/Users/philipfaure/Desktop/testSample",
#'              newDir  = "/Users/philipfaure/Desktop/testOutput",
#'              exifTag = "Subject",
#'              species = "Leopard")
#'
#' @export
#'
copySpecies <- function (inDir, newDir, exifTag, species)
{

  start <- Sys.time()

  if (Sys.info()[["sysname"]] == "Windows") {
    message("...Looking for tagged images to copy to newDir.")
    shell(
      paste(
        'exiftool -r -o .',
        ' ',
        '"-Filename=',
        newDir,
        '/%f%-c%E',
        '" ',
        '-if "$',
        exifTag,
        '=~/',
        species,
        '/i',
        inDir,
        sep = ""
      )
    )
  }
  else {
    message("...Looking for tagged images to copy to newDir.")
    system(
      paste(
        "exiftool -r -o . ",
        "'-Filename=",
        newDir,
        "/%f%-c%E",
        "' -if '$",
        exifTag,
        "=~/",
        species,
        "/i' ",
        inDir,
        sep = ""
      )
    )
  }


  # need to still work on this section so that the images are renamed correctly when there are multiple images
  # of the same name. Also below code is wrong because it is using the newDir and not the old dir...
  # But I need to stop procrastinating now and continue with my actual work.....

# files = as.data.frame(exifr::read_exif(newDir, tags = "DateTimeOriginal", recursive = T))
#
# files[,2] <- paste(files[,2], ".JPG", sep = "")
#
# files[,2] <-
#   gsub(
#     files[,2],
#     pattern = " ",
#     replacement = "_"
#   )
#
# files[,2] <-
#   gsub(
#     files[,2],
#     pattern = ":",
#     replacement = "-"
#   )
#
# tmp <- gsub(files[,1], pattern=paste(newDir, "/", sep = ""), replacement = "")
# tmp <- unlist(stringr::str_split(tmp, pattern = "/"))
# stations <- tmp[grep(tmp, pattern="station", ignore.case = T)]
#
# files[,2] <- paste(stations, files[,2], sep = "__")
#
# # need to add a fundtion which adds a number to images with the same filename.
#
# file.rename(from = ,
#             to   = )

  print(difftime(Sys.time(), start))

  message("...........................")
  message("....'Rust Never Sleeps'....")
  message("...........................")

}
