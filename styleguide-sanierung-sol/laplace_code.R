### Gruppe LAPLACE ###

## Praktische Uebung 3

# erstellen eines Griechisch-Lateinischen Quadrats (7x7)
# mit kuenstlichen Treatments/Blockauspraegngen
# TREATMENT (1= 10% weniger, 2= gleicher Preis, 3 = 10% mehr)
# ZEIT (morgens, mittags, abends)
# STRECKE (1,2,3,4)
# WOCHENTAGE ("Mo", "Di", "Mi", "Do", "Fr", "Sa", "So")

library(agricolae)

# Benennung
strecke <- c("strecke 1", "strecke 2", "strecke 3", "strecke 4")
zeit <- c("morgens","mittags","abends")
wochentag <- c("Mo", "Di", "Mi", "Do", "Fr", "Sa", "So")
treatment <- factor(c(1,2,3,NA,NA,NA,NA))

## Funktion fuer Erstellung eines Griechisch-Lateinischen Quadrats (7x7)
gr_lat_quadr <- function(trt1, trt2) {
  outdesign <- design.graeco(trt1 = trt1, trt2 = trt2 ,serie = 2)
  graeco <- outdesign$book
  plots <- as.numeric(graeco[,1])
  quadrat <- print(outdesign$sketch)
}

## Funktion fuer Erstellung des reduzierten Griechisch-Lateinischen Quadrats
red_quadrat <- function(quadrat) {
  red_quadrat <- as.data.frame(quadrat[1:3,1:4], col.names = strecke, row.names = zeit)
  colnames(red_quadrat) <- strecke
  print(red_quadrat)
}

# BEISPIEL: Griechisch-Lateinisches Quadrat (7x7)
quadrat_bsp <- gr_lat_quadr(wochentag, treatment)

#BEISPIEL: reduziertes Griechisch-Lateinisches Quadrat
# Zeilen/Spalten mit kuenstlichen Treatments/Blockauspraegungen fehlen
red_quadrat_bsp <- red_quadrat(quadrat_bsp)

#-----------------------------------------
## 12 Griechisch-Lateinische Quadrate (7x7), eins für jede Woche

wochentag <- factor(1:7)

set.seed(12345)

quadrat1 <- gr_lat_quadr(wochentag, treatment)  
quadrat2 <- gr_lat_quadr(wochentag, treatment)
quadrat3 <- gr_lat_quadr(wochentag, treatment)  
quadrat4 <- gr_lat_quadr(wochentag, treatment)
quadrat5 <- gr_lat_quadr(wochentag, treatment)  
quadrat6 <- gr_lat_quadr(wochentag, treatment)
quadrat7 <- gr_lat_quadr(wochentag, treatment)  
quadrat8 <- gr_lat_quadr(wochentag, treatment)
quadrat9 <- gr_lat_quadr(wochentag, treatment)  
quadrat10 <- gr_lat_quadr(wochentag, treatment)
quadrat11 <- gr_lat_quadr(wochentag, treatment)  
quadrat12 <- gr_lat_quadr(wochentag, treatment)


# 12 reduzierte Griechisch-Lateinische Quadrate
# Zeilen/Spalten mit kuenstlichen Treatments/Blockauspraegungen fehlen

red_quadrat1 <- red_quadrat(quadrat1)
red_quadrat2 <- red_quadrat(quadrat2)
red_quadrat3 <- red_quadrat(quadrat3)
red_quadrat4 <- red_quadrat(quadrat4)
red_quadrat5 <- red_quadrat(quadrat5)
red_quadrat6 <- red_quadrat(quadrat6)
red_quadrat7 <- red_quadrat(quadrat7)
red_quadrat8 <- red_quadrat(quadrat8)
red_quadrat9 <- red_quadrat(quadrat9)
red_quadrat10 <- red_quadrat(quadrat10)
red_quadrat11 <- red_quadrat(quadrat11)
red_quadrat12 <- red_quadrat(quadrat12)



