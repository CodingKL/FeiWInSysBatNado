#!/bin/sh
# GNU All-Permissive License
SDQUO=$(echo -ne '\u2018\u2019')
RDQUO=$(echo -ne '\u201C\u201D')

#SED -i -e "s/[$SDQUO]/\'/g" -e "s/[$RDQUO]/\"/g" "${1}"
#sed -i -e "s/[$SDQUO]/\'/g" -e "s/[$RDQUO]/\"/g" "${1}"

sed -i -e "s/[$SDQUO]/\'/g" -e "s/[$RDQUO]/\"/g" "${1}"

