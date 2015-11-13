##Import data, no column names, and 999 is NA, but so is North America

mammal <- read.csv("MOMv3.3.txt", sep="\t", header=FALSE, stringsAsFactors = FALSE, na.strings = "-999")

head(mammal)
