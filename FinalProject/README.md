### Name: Keoni Lanoza
### Student ID: 2344852
### Student Email: lanoza@chapman.edu
### Class: CPSC 354 - 02
### Date Of Submission: 12/16/22


## PROJECT MILESTONES

As of December 16th, 2022, I have accomplished the following features of this project:

- Edited the base PEG.JS grammar to accomodate the additional features I wanted to add to the calculator
- Adding exponentiation to the calculator
- Adding a derivative function to the calculator
- Adding simple integration of constants and variables to the calculator

I have yet to implement or find an alternative for the following:

- Adding an assignment feature to the calculator that extends beyond the scope of one eval() function.
- Adding integration of functions to the calculator


## KNOWN BUGS
At the time of writing, there are a few issues with this project. I've observed that the code in `index.html` does not allow me to display data from `interpreter.js` in the webpage. Through my research, I've concluded that this is because browsers do not have support for the JavaScript `require()` function, and that a common workaround is to use a bundler to create a `bundle.js` file which is a webpage-compatible version of files that use the `require()` function or other webpage-incompatible code.

## LESSONS LEARNED
- This assignment has allowed me to strengthen my knowledge of context-free grammars, interpreters, parsers, JavaScript, and HTML. While I still have far to go before I call this project portfolio-worthy, I can confidently say that I know the purpose of context-free grammars, parsers, and interpreters. 
