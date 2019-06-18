#!/usr/local/bin/bash

# Guardamos en un array los días del año
readarray -t days < ~/github/data-average/data/dias.csv

for ((j = 0; j < ${#days[@]}; j++)); do

    csvgrep -c fecha -r "${days[$j]}$" ~/github/data-average/data/9434-1980-2009.csv | csvstat -c maxima --mean > temp.csv

done
