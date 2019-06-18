#!/usr/local/bin/bash

: '
Dependencias: csvkit - bash 4.0 >

Script para obtener la media de temperatura de cada día del año.
Cargamos todos los días del año.
Creamos un bucle para iterar sobre todos esos días.
Buscamos con CSVGREP cada uno de los días.
Con el resultado de la búsqueda calculamos la media de ese día con CSVSTAT --mean.
'

# Guardamos en un array los días del año
readarray -t days < ~/github/data-average/data/dias.csv

for ((j = 0; j < ${#days[@]}; j++)); do

    csvgrep -c fecha -r "${days[$j]}$" ~/github/data-average/data/9434-2010-2019.csv | csvstat -c maxima --mean >> temp.csv

done

# Modificamos el separador del decimal, no me gusta la coma, la cambio por punto
sed -i 's/,/./g' temp.csv

# Nos quedamos solamente con un decimal
sed -i 's/\([0-9]\+\.[0-9]\)[0-9]*$/\1/' temp.csv
