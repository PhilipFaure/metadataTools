#' Copy photos of specific species from specific year
#'
#' Copy all images from a directory which has a certain metadata tag and from a certain year as specified by the user. This function is very much similar to the getSpeciesImages function from the camtrapR package except you can specify which year the images are from and it can use Windows Live Gallery tags as well as digiKam tags.
#'
#'
#' @param inDir character. The directory where all the images are saved in.
#' @param newDir character. The directory where you would like to copy your images to.
#' @param exifTag character. The name of the species tag column. For images tagged in Windows Live Gallery use "Subject", and for images tagged in digiKam use "HierarchicalSubject" as the input argumenets. Actually, now after I have cheanged the code to include digiKam, I think "Subject" might just work for both... *palm to face
#' @param species character. The species tag as tagged in Windows Live Gallery.
#' @param year integer. The year from which you would like the images from.
#' @return Copies all images according to the specified arguments (species, year) to a new directory as chosen by the user.
#'
#' @export
#'
#' @author Philip Faure, \email{philip.faure13@gmail.com}
#' @keywords Copy species by year
#'
#'
#' @examples
#' copySpByYear(inDir   = "/Users/philipfaure/Desktop/testSample",
#'              newDir  = "/Users/philipfaure/Desktop/testOutput",
#'              exifTag = "Subject",
#'              species = "Leopard",
#'              year    = 2016)
#'
#' @export
#'
copySpByYear <- function (inDir, newDir, exifTag, species, year)
{
  start <- Sys.time()
  if (Sys.info()[["sysname"]] == "Windows") {
    message("There's no I in team...")
    shell(paste('exiftool -r -o .', ' ', '"-Filename=',newDir,
                '/%f%-c%E','" ','-if "$',exifTag, '=~/',
                species,'/i',' and $DateTimeOriginal=~/^',
                year,'/" ', inDir, sep = ""))
  }
  else {
    message("There's no I in team...")
    system(paste("exiftool -r -o . ","'-Filename=",newDir,
                 "/%f%-c%E","' -if '$",exifTag,"=~/",species,
                 "/i and $DateTimeOriginal=~/^",
                 year,"/' ",inDir,sep=""))
  }
  stop  <- Sys.time()
  comp.time <- stop - start
  print(comp.time)

  message("...........................")
  message(".....Rust Never Sleeps.....")
  message("...........................")

}
