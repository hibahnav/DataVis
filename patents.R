library(tidyverse)
library(viridis)
library(hrbrthemes)



#### create dataset #######
dat <- read.csv('/Users/faizanaviwala/Desktop/data_patents.csv')
head(dat)

datappend <- data.frame(Industry = c(rep('food chem',7),rep('basic materials chem',7),rep('metallurgy',7), 
                                     rep('env tech',7),rep('chem eng',7),rep('surface tech',7)),
                        Year= c(rep(c('2014', '2015','2016', '2017','2018','2019','2020'),6)),
                        NumApps = c(1879, 1823, 1887, 1913, 2104, 2214, 2381,
                                    5716, 5453, 5472, 5639, 5573,5589, 5712,
                                    4068, 3769, 3893, 4023, 4334, 4416, 4682, 
                                    2771, 2549, 2580, 2648, 2732, 2705, 3011,
                                    4609, 4312, 4375, 4685, 4886, 5074, 5278,
                                    3496, 3295, 3272, 3579, 3680, 3851, 4015))

datappend2 <- data.frame(Industry = c( rep('Optics',7), rep('Measurement', 7), rep('Analysis-Bio Materials', 7),
                                       rep('Control',7), rep('Medical Tech', 7)),
                         Year = c(rep(c('2014', '2015','2016', '2017','2018','2019','2020'),5)),
                         NumApps = c(5981, 5861, 6611,7156, 7610, 8018,8369,
                                     9035, 8610, 9333, 10052, 10775, 11451, 12699,
                                     1841, 1662, 1766, 1912, 1940, 1917, 2058, 
                                     3140, 3017, 3687,4292, 5212, 5363, 5457, 
                                     14036, 12651, 14278, 15028, 15798, 16916, 17497
                                     )
                         )

datappend3 <- data.frame(Industry = c(rep('Handling', 7), rep('Machine Tools', 7), rep('Engines, Pumps, Turbines',7),
                                      rep('Textile&Paper Machines',7), rep('Other special machines',7), rep('thermal processes',7),
                                      rep('mechanical elements',7), rep('Transport',7)),
                         Year = c(rep(c('2014', '2015','2016', '2017','2018','2019','2020'),8)),
                         NumApps = c(4800, 4705, 5062, 5521, 5889, 5954, 6408, 
                                     3773, 3627, 3631, 3588, 4077, 4299, 4311, 
                                     6906, 6201, 5607, 5630, 5656, 5366, 5123, 
                                     2291, 2408, 2521, 2594, 2757, 2769, 2952,
                                     5377, 5615, 5758, 6395, 6959, 7235, 7476, 
                                     3008, 3015, 3153, 3635, 3866, 4085, 4305, 
                                     5883, 5927, 5781, 6115, 6187, 5952, 5843,
                                     8667, 8651, 8754, 9794, 10941, 11226, 1290)
                                    
                         )

datappend4 <- data.frame(Industry = c(rep('Furniture,Games',7), rep('Other consumer goods',7), rep('civil eng', 7),
                                      rep('electrical machinery, energy',7), rep('orgo',7), rep('nano&micro struct. tech',7)),
                         Year = c(rep(c('2014', '2015','2016', '2017','2018','2019','2020'),6)),
                         NumApps = c(3814, 3816, 4050, 4411, 4669, 4625, 4715,
                                     4004, 4391, 4749, 4990, 5403, 5444, 6046,
                                     6494, 6367, 6260, 6115, 6121, 6386, 6496,
                                     15294, 14660, 14448, 15233, 16556, 17194, 17363,
                                     6010, 5417, 5708, 5689, 5787, 5887, 6351,
                                     412, 359, 387, 423, 395, 390, 456
                                     )

                         )


head(datappend)
names(dat) <- c("Industry", "Years" , "NumApps")
names(datappend) <- c("Industry", "Years" , "NumApps")
names(datappend2) <- c("Industry", "Years" , "NumApps")
names(datappend3) <- c("Industry", "Years" , "NumApps")
names(datappend4) <- c("Industry", "Years" , "NumApps")
datfull <- rbind(dat, datappend)
datfull <- rbind(datfull, datappend2, datappend3, datappend4)
head(datfull)


#totals by year
datfull %>% group_by(Years) %>% summarise(total = sum(NumApps))

datfull <- datfull %>% group_by(Years) %>% 
  mutate(TotalApps  = sum(NumApps))


#group industries into categories - i.e., WFH

industries <- c('audio-visual tech','telecommunications','digital communication','basic communication processes',
                'computer tech','IT methods for management','semiconductors','pharmaceuticals','biotech',
                'macromolecular chem')

wfh <- c('audio-visual tech','telecommunications','digital communication',
         'basic communication processes ','computer tech','IT methods for management','semiconductors')

chem <- c('orgo', 'nano&micro struct. tech', 'food chem', 'basic materials chem', 'metallurgy', 'env tech',
          'chem eng','surface tech','pharmaceuticals','biotech','macromolecular chem')



mecheng <- c('Handling','Machine Tools', 'Engines, Pumps, Turbines', 'Textile&Paper Machines', 'Other special machines',
             'thermal processes', 'mechanical elements', 'Transport')

instruments <- c('Optics', 'Measurement', 'Analysis-Bio Materials', 'Control', 'Medical Tech')

other <- c('Furniture,Games', 'Other consumer goods','civil eng','electrical machinery, energy')


datgrouped <- datfull %>% mutate(Industry = case_when(
  Industry %in% wfh ~ "WFH",
  Industry %in% chem ~ 'Biotech, Pharma & Chem',
  Industry %in% mecheng ~ 'MechEng',
  Industry %in% instruments ~ 'Optics & Instruments',
  Industry %in% other ~ 'Other'))
  

  #!Industry %in% c(other, wfh, chem, mecheng, instruments) ~ as.character(Industry)))
  
                                    

#industries have been grouped but numbers have not been aggregated
#aggregrate numapps by year and industry
datgrouped <- datgrouped %>% group_by(Industry, Years) %>% mutate(NumApps2 = sum(NumApps))

datgrouped2 <- datgrouped %>% dplyr::select(Industry, Years, NumApps2, TotalApps) 
datgrouped2 <- datgrouped2 %>% distinct()

datgrouped3 <- datgrouped2 %>% mutate(Ratio = 100*(NumApps2 / TotalApps))



library(hrbrthemes)
library(RColorBrewer)   
MyColour <- c("#012a49" ,"#3e99bd", "#3ebda2", "#dfe4ec") 
names(MyColour) <- c("DarkBlue", "Blue", "Green", "Gray")

library(ggrepel)
library(grid)
devtools::install_github("thomasp85/transformr")
library(transformr)
patentwsj <- datgrouped3 %>% ggplot() + geom_line(mapping = aes(x = Years, y = Ratio, group=Industry, colour = Industry), size=1) +
  labs(title = "Worldwide Patent Applications",
       subtitle = "2014 to 2020",
       caption = "Source: World Intellectual Property Organization",
       x = "Year",
       y = "% of Applications",
       fill = "Industry")  + scale_colour_brewer(palette = "Dark2") +
  theme_economist() +  theme(panel.background = element_rect(fill = "#f3f5f8"))+
  theme(plot.background=element_rect(fill="#f3f5f8"),
                                         plot.margin = unit(c(2, 3, 2, 2), "cm")) +
  theme(legend.position = "bottom",legend.text = element_text(size=9), 
        legend.title = element_text(size=12)) +
  transition_reveal(as.numeric(Years)) 


anim_save('patent_wsj_anim.gif',patentwsj)
#, Years = c("2014L", "2015L","2016L","2017L", "2018L","2019L","2020L")

#geom_label_repel(data = filter(datgrouped3, Years == 2020),aes(x=Years, y=Ratio, label = Industry), nudge_x = 0.75,
# na.rm = TRUE) +


patent_static3 <- datgrouped3 %>% ggplot() + geom_line(mapping = aes(x = Years, y = Ratio, group=Industry, colour = Industry), size=1) +
  labs(title = "Worldwide Patent Applications Per Year",
       subtitle = "Industry Breakdown - % of Patent Applications",
       caption = "Source: World Intellectual Property Organization",
       x = "Year",
       y = "Percent of Applications",
       fill = "Industry")  + scale_colour_brewer(palette = "Dark2") +
  geom_label_repel(data = filter(datgrouped3, Years == 2020),aes(x=Years, y=Ratio, label = Industry, colour=Industry), nudge_x = 0.3,
                   na.rm = TRUE,direction = "y", hjust = "right") +
  theme_economist() +  theme(panel.background = element_rect(fill = "#f3f5f8"))+
  theme(legend.position = "none") + theme(plot.background=element_rect(fill="#f3f5f8"),
                                          plot.margin = unit(c(2, 2, 2, 2), "cm")) 

patent_static3



ggsave("patent_static3.png")

#top, right, bottom, left



#### now for the fun stuff - animation?! #####
library(gganimate)
  
p <- datgrouped3 %>% ggplot() + 
  geom_line(mapping = aes(x = Years, y = Ratio, group=Industry, colour = Industry)) +
  transition_reveal(as.numeric(Years))

anim_save('patent_animated.gif',p)

anim <- animate(p)
magick::image_write(anim, path="myanimation.gif")
magick::image_write(anim, path="myanimation.gif")


install.packages("CGPfunctions")
library(CGPfunctions)
newggslopegraph(datgrouped3, Years, Ratio , Industry) +
  labs(title="New Patents Applications by Industry", 
       caption="source: WIPO")
