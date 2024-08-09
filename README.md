# BASH-Calculator
Creating a basic calculator program in Bash that can perform addition, subtraction, multiplication, and division with two integer inputs and operation input from the user.

## Initial Pseudo Code
![image](https://github.com/user-attachments/assets/aeaf53f3-f03f-4db3-9f7f-b00c12f84faf)

## Thought Process
During class, I learned it's best practice to start testing with static numbers to see where our dynamic variables will come in. I followed this approach with '3', '4' and addition. I researched the syntax for arithmetic in Bash, found 

`$((arithmetic-expression))`, 

and used it in the below code which successfully returned '7'.

![image](https://github.com/user-attachments/assets/50294dac-a0e7-4d2d-a5f7-dedb1ebc5362)

I repeated the same function for subtraction, multiplication and division. For subtraction, I got -1, multiplication, 12, but for division, I got 0. I was wondering how we would account for decimal points with whole numbers, but since we are asking for an integer input, we will also get integer outputs. Researching some more, I see now that bash only supports integers so I don't have to worry about decimal points. But I do have to create an error message when there is division by 0. 

![image](https://github.com/user-attachments/assets/8c6c6f78-0723-4634-afe5-7af73c5390d8)

Result:

![image](https://github.com/user-attachments/assets/54597bf7-9642-44e0-a501-f668dc0665a5)


For division, I checked what happens when you divide by 0 and the terminal gave me an error message. 

![image](https://github.com/user-attachments/assets/45fae52e-63e8-4d35-acff-3d2099ceff42)

For my divsion section, my error message should show up when the second integer is 0 AND the operation symbol is /. Keeping that in mind, I moved onto my if else statements. 

Now, for the if else statements, the statement to run will be determined by the operator symbol typed by the user. So I have to figure out how to use the operation symbols to dictate which condition is met. 

Keeping the numbers static, I tested an if conditional based off the operation symbol, starting with '+' for addition. I added a 'read' line for the user to input an operation symbol and added a variable for it called 'symbol'. Ran the script, typed in '+' and successfully returned '7'.

![image](https://github.com/user-attachments/assets/fca2cf57-db8e-4a21-9f40-6387a5c9e026)

Result:

![image](https://github.com/user-attachments/assets/50f34912-b1f8-4918-9238-343c7d69054f)

Similar to before, I rewrote this function, each time with a different operator for subtraction, multiplication and division. Every rewrite worked fine except multiplication. When I ran the script, I got a "too many arguments" error for the line highlighted below. 

![image](https://github.com/user-attachments/assets/23d4c35c-972c-4716-8380-d829b26e225a)

Result:

![image](https://github.com/user-attachments/assets/9a0369f7-afac-4f3a-91b7-1faf9ab11170)

Playing around with the script, I realized using * in my condition statement would throw that error no matter what. I figured it was most likely a bash syntax issue where * represents something else then what I'm intending. 

Past uses of `*` were when we wanted to make sure *all* of something is included in relation to a command, for example, searching *all* of a directory or replacing *all* instances of a specified word in a file. I haven't yet figured out what it actually represents in this case here.

So I decided to use 'x' instead (which worked fine) and included that in my instructions about the available symbols the user can pick from.

![image](https://github.com/user-attachments/assets/513fbbf8-338a-4d2c-adfd-2382f4abedd8)

Next, I moved on to fitting all the arithmetic operations into one if-else statement. Since the division section required two conditionals, 1. the division function and 2. the error message, I wanted to start there. 

I used the `&&` below in hopes that if both conditions were met, the script would run division on the integers. And testing did work, until I typed in a random character as the symbol just to see what would happen and the echo message in 'else' still printed. That helped me figure out that I needed to instead create a nested if loop if I wanted different outcomes for each conditional.

![image](https://github.com/user-attachments/assets/08a63e03-e6fe-417b-a397-4a5c48057a19)

Rewrote it like so and success! Tested the function with numbers read from the terminal as well and success again.

![image](https://github.com/user-attachments/assets/1bf61558-c678-4735-8397-443032a00549)

`-ne` can also work here as it means two integers are not equal.

![image](https://github.com/user-attachments/assets/64fa2dcb-3800-420f-a92e-cc123b188914)

Now, putting it altogether. Since there are multiple possible conditions to be met, I used elif to include them all in one if statement. Testing worked!

![image](https://github.com/user-attachments/assets/fe299d1b-8caa-45f5-924d-018a33d801a0)

As I'm testing, I realize I also need an error message if the user types in non-integers for int1 and int2. For int1 and int2, I typed in 't' and 'g' and got the below error.

![image](https://github.com/user-attachments/assets/990d6ffd-6374-4d82-ab3a-989c8581ebfe)


So for an error message to pop up if a user enters a non integer, I had to figure out how to test if an input is a non-integer. From this [forum](https://stackoverflow.com/questions/4137262/is-there-an-easy-way-to-determine-if-user-input-is-an-integer-in-bash), I found that I can write the below command where I test if the input variable is equal to itself (which should only output "TRUE" if it's a real number because we're talking about an actual math value here). 

Command: `if [[ $((foo)) != $foo ]]`


And from there, I can make that into an if statement where if the input variable is not equal to itself, a.k.a not a number, then I echo out an error message and have the script stop. And then do the same for the second input I request from the user. I'm wondering if I can write that as separate commands after each "read" command early in my script, or if I have to re-write my script into a giant if statement with all commands nested in that first if condition (for the first integer read from the user).

First, I made a new test script below (and corny on purpose) to test this command.

![image](https://github.com/user-attachments/assets/7c8f542f-7b24-45fa-850a-433576474949)

It seemed to work, however, my error message successfully showed up only when I typed in single letters as the prompt (ie. 'g' or 'k'). If I typed in an input like '90000pl' or 'gdjkdj', a generic shell-generated error message would show up. So I  believe this command only works on integers and single letters, or won't read inputs of large strings or a string with both letter and numeric characters.

![image](https://github.com/user-attachments/assets/3c8e31d6-4c17-49c0-b7ed-7d5f8fb4a40b)

So, back to the drawing board. I went back to the forum for the other solution given - writing a function that checks if there's "length" in the string, string being the input from the user. "Length" being present in the string indicates that string type value(s) - so literal letters or characters - are present in the input. 

The command is `if [[ -n ${input//[0-9]/} ]]` and I tested this out in another test script below. 

![image](https://github.com/user-attachments/assets/3906ce44-1e71-435b-80b6-09a290ee6467)

This time around, the script worked as intended and threw my error message at any type of input that wasn't an integer. We are in business.

![image](https://github.com/user-attachments/assets/c6eea882-bc63-4afe-97ed-19393527d637)


Understanding this command: `if [[ -n ${input//[0-9]/} ]]`
Zooming in to out:
- The `[0-9]` part represents our pattern which encompasses all digits from 0 to 9.
- `//` means to replace all occurrences of the pattern: [0-9].
- Lastly, the `/` after the pattern means to replace all digits in the input with nothing, basically deleting them out of the input.

So altogether, if I as the user typed in '676hel90lo8' as my input, this part of the command would translate it into 'hello' before moving on to the next part.

The next part includes the `-n` flag, which checks if the length of the string is not zero, or not empty. If it's not empty, the condition output is 'TRUE'. So since my input includes the letters 'hello' (after all my digits were "erased") this line would return back 'TRUE' indicating non-integer bits were present in the input.

## ***EDIT: (Section for how I bring it altogether)
So now that I've confirmed I can check for non-integer inputs this way, I have to finnaegle this back into my main calculator script...


To finish off this script, I added in echo messages to serve as instructions for user input, pseudo code labels where needed, and descriptive output messages that print the arithmetic equation and answer. I also made int1 and int2 as variables to be read from the user's input.


## Conclusion
I'm getting faster at scripting and documenting at the same time. Starting with drawing this concept out on paper and then only working with static variables once I started scripting was immensely helpful. 
