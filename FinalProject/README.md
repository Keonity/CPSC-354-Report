### Name: Keoni Lanoza
### Student ID: 2344852
### Student Email: lanoza@chapman.edu
### Class: CPSC 354 - 02
### Date Of Submission: 12/18/22

## PROJECT MILESTONES

As of December 18th, 2022, I have accomplished the following features of this project:

- Edited the base PEG.JS grammar to accomodate the additional features I wanted to add to the calculator
- Adding exponentiation to the calculator
- Adding a derivative function to the calculator
- Adding simple integration of constants and variables to the calculator
- A CLI-specific implementation of the calculator.
- Full webpage integration
- Added definite integral evaluation to the calculator (Alternative for integrating functions)

I have yet to implement or find an alternative for the following:

- Adding an assignment feature to the calculator that extends beyond the scope of one eval() function.
- Adding full integration of functions to the calculator
- Regarding the above two points:
 Originally, I had also planned to implement variable-to-integer assignment along with full integration capabilities for functions, but these proved difficult. Creating and assigning variables dynamically is not only difficult, but I found also dangerous, and full integration capabilities for functions is not supported by integral evaluation modules for JavaScript.

## PROJECT OVERVIEW

This project is extending the default PEG.JS calculator functionality by adding variable assignment, exponentiation, integration, and derivation features. Here is how to run the program:

### RUNNING INSTRUCTIONS

#### WEBPAGE
1. Be sure you are in the main folder of the project. (`\FinalProject\`)
2. Use `npx parcel static/index.html`
3. Enter the expression you would like parsed in the textbox.
4. Call the interpreter by pressing the `Call interpreter` button to display your results.

#### WEBPAGE CLI
1. Be sure you are in the main folder of the project. (`\FinalProject\`)
2. Use `npx parcel static/index.html`
3. You can view the console of the page by right-clicking on the page, clicking on `Inspect source`, and then navigating to your browser's console tab.
4. Call the function: `parseGrammar(string)` in the console to parse a math expression defined within the above grammar.
5. The output of the parser will be displayed on screen next to: `Calculator Output: `

#### CLI

1. Use `cd static/js`
2. Use `node ./cli.js`
3. Follow the in-line instructions to parse your expression.
    - GRAMMAR
        - You can call any of the basic math operations(+, -, /, *, %, ^) with the following grammar:
        `Number Operation Number` (e.g. `2 + 2`)
        - You can indicate you want to derive a function by following the grammar: `_$FunctionHere$FunctionVariable$_` (e.g. `_$X^2$X$_`)
        - You can indicate that you want to integrate a definite integral by following the grammar:
        `.Function$UpperBound$LowerBound.` (e.g. `.x^2$0$5.`)
        - You can indicate that you want to integrate a variable by following the grammar:
        `~Variable` (e.g. `~X`)
        - You can indicate that you want to integrate a constant by following the grammar:
        `(Base character of tilde key[key under escape])Number` 


## KNOWN BUGS
None known at the time of writing.

## LESSONS LEARNED
- This assignment has allowed me to strengthen my knowledge of context-free grammars, interpreters, parsers, JavaScript, and HTML. While I still have far to go before I call this project portfolio-worthy, I can confidently say that I know the purpose of context-free grammars, parsers, and interpreters. 

- I have also learned through this assignment the complications between Node JS, ES6, and CommonJS and as I've navigated them, I've learned that ES6 is the standard while CommonJS is outdated.
