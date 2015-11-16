##Link to github
##https://github.com/lbtrotta/big_mammal.git

library(dplyr)
install.packages("tidyr")
library(tidyr)

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

Repeat the analysis but this time compare the mean masses within each of the different continents (dplyr would be one way to do this). Export your results to a CSV file where the first entry on each line is the continent, the second entry is the average mass of the extant species on that continent, and the third entry is the average mass of the extinct species on that continent (spread() from tidyr is a handy way to convert the standard dplyr output to this form). Call the file



avg_mass_by_continent <- mammal_sizes %>%
                 filter(status !=('historical')) %>%
                 filter(status !=('introduction')) %>%
                 group_by(status, continent) %>%
                 summarize(mean_mass=mean(combined_mass, na.rm=T))
#Make new database
extinct_extant <- spread(avg_mass_by_continent, status, mean_mass )

##save as csv
write.csv(extinct_extant, file="continent_mass_differences.csv")




??spread()






