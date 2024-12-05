#Week 9 Homework

#1.
library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
?nchar
#nchar(surveys, type = "species")

nchar(surveys$species)

#above didn't give me what I wanted so I need to combine iteration with function but first do my forloop function...

for(i in unique(surveys$taxa)){
  taxas <- surveys[surveys$taxa == i,]
  longestnames <- taxas[nchar(taxas$species) == max(nchar(taxas$species)),] %>% 
    select (species)
  print(paste0("longest species", i, "s"))
  print(unique(longestnames$species))
}
#1] "longest speciesRodents"
#[1] "penicillatus" "ochrognathus"
#[3] "tereticaudus"
#[1] "longest speciesRabbits"
#[1] "audubonii"
#[1] "longest speciesBirds"
#[1] "brunneicapillus"
#[1] "longest speciesReptiles"
#[1] "scutalatus"

#2.

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

library(purrr)
col_max <- mloa %>% 
  select("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", "temp_C_10m", "temp_C_towertop", "rel_humid", "precip_intens_mm_hr")
col_max %>% map(max, na.rm = TRUE)
#Answer:
#$windDir [1] 360
#$windSpeed_m_s [1] 20.5
#$baro_hPa [1] -999.9
#$temp_C_2m [1] 18.9
#$temp_C_10m [1] 16.9
#$temp_C_towertop [1] 16.2
#$rel_humid [1] 138
#$precip_intens_mm_hr [1] 60

#3.
#tried adding the return part of the function in this script and it wouldn't give me an answer. Removed it and got an answer.

C_to_F <- function(x){
  x * 1.8 + 32
}
C_to_F(32) #89.6

mloa %>% 
  mutate(temp_F_2m <- C_to_F(temp_C_2m))
#didn't seem to work and add the column

mloa$temp_F_2m <- C_to_F(mloa$temp_C_2m)
#worked!
mloa$temp_F_10m <- C_to_F(mloa$temp_C_10m)
#worked!
mloa$temp_F_towertop <- C_to_F(mloa$temp_C_towertop)
#worked!
view(mloa)

#for sake of time and being a bit behind I will work on bonus and challenge section later and give these a try before the final. Still not 100% on this topic, so will re go over notes and practice and then try. 