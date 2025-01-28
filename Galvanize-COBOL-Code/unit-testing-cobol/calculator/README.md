# Calculator

**Before you start:**

- *Try not to read ahead.*
- Do one task at a time. The trick is to learn to work incrementally.
- Make sure you only test for correct inputs. There is no need to test for invalid inputs for this kata

## String Calculator

Create a simple String calculator with a method signature:

`int add(string numbers)`

The method accepts one or two numbers, which can be separated by commas. It calculates and returns their sum.

For example, inputs could be an empty string, a single number like `"1"`, or two numbers separated by a comma like 
`"1,2"`. If the input is an empty string, it will return "0".

Hints:

- Start with the simplest test case of an empty string and move to one and then two numbers.
- Remember to solve things as simply as possible so that you force yourself to write tests you did not think about.

Allow the Add method to handle an unknown amount of numbers

Allow the Add method to handle new lines between numbers (instead of commas).

- Invalid: `"1,\n"` (not need to prove it - just clarifying).
- Valid: `"1\n2,3"` (will equal 6).


Support different delimiters to change a delimiter, the beginning of the string will contain a separate line that looks
like this: `"//[delimiter]\n[numbers…]"` for example `"//;\n1;2"` should return three where the default delimiter is `';'`.
the first line is optional. all existing scenarios should still be supported

Calling Add with a negative number will throw an exception “negatives not allowed” - and the negative that was passed.
If there are multiple negatives, show all of them in the exception message.

STOP HERE if you are a beginner. Continue if you can finish the steps so far in less than 30 minutes.

Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2

Delimiters can be of any length with the following format:
```
"//[delimiter]\n"
```
for example:
```
"//[***]\n1***2***3"   //should return 6
```


Allow multiple delimiters like this:
```
"//[delim1][delim2]\n"
```
for example
```
"//[*][%]\n1*2%3"     //should return 6
```

Make sure you can also handle multiple delimiters with length longer than one character.

> cobc -x calculator-tests.cbl calculator.cbl ../GUnit-Demo/GUnit-V2.cbl && ./calculator-tests
