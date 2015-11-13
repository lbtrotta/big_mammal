##Link to github
##https://github.com/lbtrotta/big_mammal.git

library(dplyr)

##Import data, no column names, and 999 is NA, but so is North America
##Want to ignore species listed as historical in status column
mammal_sizes <- read.csv("MOMv3.3.txt", sep="\t", header=FALSE, stringsAsFactors = FALSE, na.strings = "-999")

head(mammal_sizes)

##Add col names
colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")

##mean mass of extant species
extant_mass <- mean(mammal_sizes$combined_mass[mammal_sizes$status=="extant"], na.rm=T)

##mean mass of extinct species
extinct_mass <- mean(mammal_sizes$combined_mass[mammal_sizes$status=="extinct"], na.rm=T)






