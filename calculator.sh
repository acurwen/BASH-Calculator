#!/bin/bash
#BASIC CALCULATOR

#Read first integer from user
echo "Please type in your first number: "
read int1

#Read second integer from user
echo "Please type in your second number: "
read int2

#Read operation symbol from user '+' '-' 'x' '/'
echo "Please type in your operator symbol (For addition, type '+'; For subtraction, type '-'; For multiplication, typ>
read symbol

#Division: if '/' then divide
if [[ "$symbol" == / ]]
then
        #if int2 does not equal 0, go ahead and divide
        if [[ "$int2" != 0 ]]
        then
                dtotal=$(($int1 / $int2))
                echo ""$int1" / "$int2" = "$dtotal"."

        else
                #if int2 equals 0, show error message
                echo "Cannot divide by 0 bro."
        fi

#Addition: if '+' then add
elif [[ "$symbol" == + ]]
then
        atotal=$(($int1 + $int2))
        echo ""$int1" + "$int2" = "$atotal"."

#Subtraction: if '-' then subtract
elif [[ "$symbol" == - ]]
then
        stotal=$(($int1 - $int2))
        echo ""$int1" - "$int2" = "$stotal"."

#Multiplication: if 'x' then multiply
elif [[ "$symbol" == x ]]
then
        mtotal=$(($int1 * $int2))
        echo ""$int1" x "$int2" = "$mtotal"."

else
        echo "Operation symbol not entered."
fi
