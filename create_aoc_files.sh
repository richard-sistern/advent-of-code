#!/bin/bash

DIR=$(dirname $(readlink -f $0))
YEAR=2023


mkdir $DIR/$YEAR

for i in `seq -w 1 25`; do
mkdir $DIR/$YEAR/day-$i

if [ -z "$(ls -A $DIR/$YEAR/day-$i)" ]; then
    touch $DIR/$YEAR/day-$i/day-$i-part-1.rb
    touch $DIR/$YEAR/day-$i/day-$i-part-2.rb
    touch $DIR/$YEAR/day-$i/README.txt
    touch $DIR/$YEAR/day-$i/day-$i-input.txt
    chmod +x $YEAR/day-$i/*.rb
fi
done
