# -*- coding: utf-8 -*-
"""
Created on Wed Feb 26 19:28:00 2025

@author: joana
"""

from bs4 import BeautifulSoup
import requests

csv_wiki = requests.get("https://en.wikipedia.org/wiki/Comma-separated_values")
soup = BeautifulSoup(csv_wiki.text, 'html.parser')
soup

info = soup.find('table', class_ = 'wikitable').findNext('pre').text
info

f = open('car.csv', 'w')
f.write(info)
f.close()