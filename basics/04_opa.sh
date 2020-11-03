#!/bin/bash

#Comparison
####
# -eq [a==b] 
# -ne [a!=b]
# -gt [a > b]
# -ge [a >= b]
# -lt [a < b]
# -le [a <= b]
####

NUM=52
NUM2=5

if ["$NUM" -gt "$num2"]
then
    echo "$NUM is greter than $NUM2"
else
    echo "$NUM is less than $NUM2"
fi