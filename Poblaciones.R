# chequeamos si las librerías están instaladas y si es necesario se instalan
if ("readxl" %in% installed.packages()[,"Package"]) {library(readxl)} else {install.packages("readxl");library(readxl)}
if ("openxlsx" %in% installed.packages()[,"Package"]) {library(openxlsx)} else {install.packages("openxlsx");library(openxlsx)}
if ("highcharter" %in% installed.packages()[,"Package"]) {library(highcharter)} else {install.packages("highcharter");library(highcharter)}

