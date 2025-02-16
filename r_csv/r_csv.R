#loading packages 
library(rvest)
library(dplyr)
library(rstudioapi)

#setwd to r file directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#read html
url <- "https://en.wikipedia.org/wiki/Comma-separated_values"
webpage <- read_html(url)

# Extract csv example
csv_example <- webpage %>%
  html_nodes(xpath = '//*[contains(text(), "Year,Make,Model,Description,Price")]') %>%
  html_text()
csv_lines <- unlist(strsplit(csv_example, "\n"))

# Create a data frame
csv_data_frame <- read.csv(text = csv_lines, header = TRUE)

# Save csv with name "cars_example"
write.csv(csv_data_frame, "cars_example.csv", row.names = FALSE)

