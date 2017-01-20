#!/bin/bash

#Define Constant
declare -r ORDER=2

#Can't have space on both side of "=" when declaring variables
num1=5
num2=2

#Print multiple lines
cat << END
There are 3 functions you can use
1.getDate
2.doSquare
3.doMath
4.checkFile
5.subStr
6.loop
END

read -p "Input your choice: " choice

#Define Function
getDate(){
    date
    return
}

doSquare(){
    local num=$1
    local num_sqr=$((num ** ORDER))
    echo "$num^2 = $num_sqr"
}

doMath(){
    local num1=$1
    local num2=$2
    
    local result1=$((num1+num2))
    local result2=$((num1-num2))
    local result3=$((num1*num2))
    local result4=$((num1/num2))

    echo "$num1 + $num2 = $result1"
    echo "$num1 - $num2 = $result2"
    echo "$num1 * $num2 = $result3"
    echo "$num1 / $num2 = $result4"
}

checkFile(){
    local file_name=$1
    if [ -e "$file_name" ]; then
        echo "$file_name exists"

        if [ -f "$file_name" ]; then
            echo "$file_name is normal"
        fi
        if [ -r "$file_name" ]; then
            echo "$file_name is readable"
        fi
        if [ -w "$file_name" ]; then
            echo "$file_name is writable"
        fi
        if [ -x "$file_name" ]; then
            echo "$file_name is executable"
        fi
        if [ -d "$file_name" ]; then
            echo "$file_name is a directory"
        fi
        if [ -L "$file_name" ]; then
            echo "$file_name is a symbolic link"
        fi
    fi
}

subStr(){
    local input_str=$1
    local index_start=$2
    local index_end=$3
    
    local str_length=${#input_str}

    if [ $index_start > $str_length-1  ] || [ $index_end > $str_lenght-1 ]; then 
        echo "wrong index"
    else
        if [ !$index_end ]; then
            echo "${input_str:$index_start}"
        else
            echo "${input_str:$index_start:$index_end}"
        fi
    fi
}

loop(){
    max=15
    while [ $max -ge 0 ]; do
        echo "$max"
        max=$((max - 1))
    done
    #while read var1 var2 var3 ...; do done

    for(( i=0; i<=10; i++)); do
        echo $i
    done

    for i in {A..Z}; do
        echo $i
    done
}

#result=$(doMath $num1 $num2)
#echo -e "Result of doMath is\n$result"

#Condition eq ne le lt ge gt
printResult(){
    local choice=$1
    if [ $choice == 1 ]; then 
        #echo "your choice is 'getDate'"
        getDate
    elif [ $choice == 2 ]; then 
        #echo "your choice is 'doSquare'"
        doSquare $num1
    elif [ $choice == 3 ]; then 
        #echo "your choice is 'doMath'"
        doMath $num1 $num2
    elif [ $choice == 4 ]; then 
        echo "your choice is 'checkFile'"
        #checkFile $file_name
    elif [ $choice == 5 ]; then
        local input_str="a random test string"
        local from=2
        local to=10
        subStr $input_str $from $to
    elif [ $choice == 6 ]; then
        loop 
    else
        echo "No such choice"
    fi
}

printResult $choice

read -p "How old are you: " age
isAdult=0
(( age >= 18?(isAdult=1):(isAdult=0) ))

if [ $isAdult == 1 ]; then
    echo "You are an adult"
else
    echo "You are not an adult"
fi

case $age in
[0-7])
    echo "Too young for school"
    ;;
8)
    echo "Go to kindergarten"
    ;;
9|1[0-4]) #9 or 10~14
    grade=$((age-8))
    echo "Go to elementory $grade"
    ;;
1[5-7])
    echo "Go to senior high"
    ;;
1[8-9]|20)
    echo "Go to junior high"
    ;;
2[1-4])
    echo "Go to college"
    ;;
*)
    echo "Go to work"
    ;;
esac

