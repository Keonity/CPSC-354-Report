### Name: Keoni Lanoza
### Student ID: 2344852
### Student Email: lanoza@chapman.edu
### Class: CPSC 354 - 02
### Date Of Submission: 12/18/22

## PROJECT OVERVIEW

This project is extending the default PEG.JS calculator functionality by adding variable assignment, exponentiation, integration, and derivation features. Here is how to run the program:

### RUNNING INSTRUCTIONS

#### WEBPAGE
1. Be sure you are in the main folder of the project. (`\FinalProject\`)
2. Delete the `\FinalProject\node_modules\` folder
3. Use `npm install`
4. Use `npx parcel static/index.html`
5. Enter the expression you would like parsed in the textbox.
6. Call the interpreter by pressing the `Call interpreter` button to display your results.

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

## ADDING FEATURES

1. Changing the webpage is pretty easy! Simply edit the index.html file to your liking. For example, you can change the layout of the page by reorganizing the HTML elements such as buttons and headers. You can further change the page to your liking by editing HTML attributes.

2. To add new arithmetic operations to the calculator, you should open the test.pegjs file in Visual Studio Code or another similar workspace.

3. Add to the grammar your new arithmetic operation. Referenece https://pegjs.org/documentation#grammar-syntax-and-semantics for the grammar syntax and semantics. Make sure you give your rule a rule name.

4. Run pegjs test.pegjs to generate a test.js file(parser) that reflects your updates to the grammar.

5. Open interpreter.js in the same program you opened test.pegjs in. Make a new line after line 87 and enter the following:
```
else if (listCommand[i] === "YourRuleNameHere" && i === 0) 
{
    // A way for the console to receive the output of the calculator. This is up to yoru design. I usually chose something like: console.log("Calculator Output: " + String(listCommand[i+1][0]) + 'x + C')

    // A way for the webpage to receive the output of the calculator. This is also up to your design. I usually chose something like: window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(listCommand[i+1][0]) + 'x + C'
}
```

## KNOWN BUGS
None known at the time of writing.

## LESSONS LEARNED
- This assignment has allowed me to strengthen my knowledge of context-free grammars, interpreters, parsers, JavaScript, and HTML. While I still have far to go before I call this project portfolio-worthy, I can confidently say that I know the purpose of context-free grammars, parsers, and interpreters. 

- I have also learned through this assignment the complications between Node JS, ES6, and CommonJS and as I've navigated them, I've learned that ES6 is the standard while CommonJS is outdated.

## REFERENCES

1. https://pegjs.org - Provided a foundation of which I built the calculator off of
2. https://learnjavascript.online - Where I learned most of the Javascript I know
3. https://www.learn-html.org - Where I learned most of the HTML I know
4. https://mathjs.org - Provided evaluate and derivative functions for the calculator
5. https://electerious.medium.com/from-commonjs-to-es-modules-how-to-modernize-your-node-js-app-ad8cdd4fb662 - Provided information on how to convert CommonJS modules to ES modules which allowed me to use Parcel for building a functional website
6. https://parceljs.org/docs/ - Used as a bubndler to allow HTML to display Javascript output on the webpage
7. https://www.w3schools.com/html/html_formatting.asp - For help on formatting the webpage
8. https://www.javatpoint.com/how-to-call-javascript-function-in-html - Provided a basic foundation on how to use Javascript functions in HTML. This ultimately did not end up working so simply for me because of the modules I was using but I learned a lot from it.
9. https://github.com/browserify/browserify - The first bundler I used. This also did not end up working for me but I learned a lot from troubleshooting it.
10. https://flexiple.com/javascript/call-javascript-from-html/ - Another reference on how to call Javascript functions in HTML.
11. https://stackoverflow.com - I referred to many posts on this website regarding other issues similar to mine that other users have faced and what solutions they've found for those issues. A few examples are https://stackoverflow.com/questions/39961003/calling-functions-in-html-from-external-javascript-file and https://stackoverflow.com/questions/51882029/calling-a-javascript-function-from-an-external-js-file-in-the-html-file. There are many posts similar to these that I referred to because finding a way to output Javascript function output onto an HTML webpage was a big hurdle in this project. There are also many posts regarding Javascript ES and CommonJS modules and the differences in how to use them.


