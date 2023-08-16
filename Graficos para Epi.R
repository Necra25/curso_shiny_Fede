###Graficos para datos epi

library(readxl)
library(tidyverse)
library(ISOweek)
library(tidyr)
library(highcharter)
library(tsibble)
library(lubridate)
library(geojsonsf)
library(echarts4r)
library(sf)
library(tmap)
library(leaflet)
library(DT)

##leo la tablas
datos_respiratorias <- 
  read_excel("RMD/RMD003_Analisis/datos/informacion-publica-respiratorias-nacional-hasta-20230706.xlsx")


##para otros años
datos_respiratorias2 <- read_excel("RMD/RMD003_Analisis/datos/informacion-publica-respiratorias-nacional-hasta-20220905.xlsx")

datos_eti <- datos_respiratorias %>%
  filter(evento_nombre == "Enfermedad tipo influenza (ETI)") %>%
  group_by(provincia_nombre, provincia_id, año, semanas_epidemiologicas) %>%
  summarise(conteo = sum(cantidad_casos))

datos_eti2 <- datos_respiratorias2 %>%
  filter(evento_nombre == "Enfermedad tipo influenza (ETI)",
         año != 2022) %>%
  group_by(provincia_nombre, provincia_id, año, semanas_epidemiologicas) %>%
  summarise(conteo = sum(cantidad_casos))

datos_eti <- rbind(datos_eti, datos_eti2)
DT::datatable(head(datos_eti))

