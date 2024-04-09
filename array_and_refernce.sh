#!/bin/bash

armin=("ala" "ma" "kota")
echo ${armin[@]}   # => values
echo ${!armin[@]} # => keys
echo ${#armin[@]} # => length

declare -n gral=armin
echo ${gral[@]}
echo ${!gral[@]}
echo ${#gral[@]}

armin+=('i')
gral+=('psa')
echo ${gral[@]}
echo ${!gral[@]}
echo ${#gral[@]}

unset gral[3]
unset gral[2]

echo ${gral[@]}
echo ${!gral[@]}
echo ${#gral[@]}
echo ${armin[@]}


myFun() {
    declare -n arr="$2"
    echo '----------------------------'
    echo ${!arr[@]}
    echo ${arr[0]}
    echo ${arr[1]}
    echo ${arr[4]}

    echo '----------------------------'
    for val in ${arr[@]}; do
<------>echo $val
    done
    for key in ${!arr[@]}; do
<------>echo $key' => '${arr[$key]}
    done

    echo '----------------------------'
    arr+=("i" "konia")
    arr[2]="kota"
    arr[3]="i"
    for key in ${!arr[@]}; do
<------>echo $key' => '${arr[$key]}
    done
}


myFun 'aaaa' armin
echo '------------------'
for key in ${!gral[@]}; do
    echo $key' => '${gral[$key]}
done

