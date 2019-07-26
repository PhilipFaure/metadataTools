#' Copy photos of specific species
#'
#' Copy all images from a specified directory which has a certain metadata species tag to a specified directory set by user. This function is very much similar to the 'getSpeciesImages' function from the camtrapR package except you can use Windows Live Gallery tags as well as digiKam tags.
#'
#'
#' @param inDir character. The directory where all the images are saved in.
#' @param newDir character. The directory where you would like to copy your images to.
#' @param exifTag character. The name of the species tag column. For images tagged in Windows Live Gallery use "Subject", and for images tagged in digiKam use "HierarchicalSubject" as the input argumenets. Actually, now after I have cheanged the code to include digiKam, I think "Subject" might just work for both... *palm to face
#' @param species character. The species tag as tagged in Windows Live Gallery.
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

  print(difftime(Sys.time(), start))

  message("...........................")
  message("....'Rust Never Sleeps'....")
  message("...........................")

}
