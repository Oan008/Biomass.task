library(tidyverse)
library(readxl)
library(dplyr)

####import data###
Site_L <- read_excel("~/Desktop/biostat2/biomass2015.xls", sheet = 1)
Site_M <- read_excel("~/Desktop/biostat2/biomass2015.xls", sheet = 2)
Site_A <- read_excel("~/Desktop/biostat2/biomass2015.xls", sheet = 3)
Site_H <- read_excel("~/Desktop/biostat2/biomass2015.xls", sheet = 4)
######merging datasets######

Biomass.1 <- dplyr::full_join(Site_L, Site_M)
Biomass.2 <- dplyr::full_join(Site_A, Site_H)
Biomass.tot <- dplyr::full_join(Biomass.1, Biomass.2)
view(Biomass.tot)

######Summarize the production to get biomass####

Biomass.df <- Biomass.tot %>% 
  group_by(site, plot) %>% 
  summarise(Biomass = sum(production, na.rm = TRUE))


##########Make the plot#########

P1 <- ggplot() + geom_boxplot(data = Biomass.df, aes(x = site, y = Biomass, fill= site))
P1


