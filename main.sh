#!/bin/bash

infile=names
outfile=result
rounds=2
tmpdir=$(mktemp -d)
already=${tmpdir}/cur

people=$(awk -F':' '{print $1}' ${infile} | tee -a ${outfile})
for((r=0;r<${rounds};r++)); do
  tmpfile=${tmpdir}/${r}
  touch ${tmpfile}
  echo "${people}" | while read name; do
    egrep "^${name}:" ${outfile} | sed -e"s/${name}://" -e "s/:/\n/" > ${already}
    potential=$(echo "${people}" | egrep -v "^${name}$" | fgrep -vf ${tmpfile} |fgrep -vf ${already})
    count=$(echo "${potential}" | wc -l)
    idx=$((${RANDOM} % ${count}))
    let idx+=1
    candid=$(echo "${potential}" | head -n ${idx} | tail -1 | tee -a ${tmpfile})
    [[ -z ${candid} ]] && { echo "ERROR!"; exit 2; }
    sed -i "/^${name}/ s/$/:${candid//&/\\&}/g" ${outfile}
  done
done

rm -rf ${tmpdir}
