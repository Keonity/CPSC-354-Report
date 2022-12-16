//import * as mathjs from 'mathjs';

var parser = require('./test.js');

const mathjs = require('mathjs')
const listCommand = (parser.parse("_$2*x$x$_"));
console.log(listCommand)
for (let i = 0; i<listCommand.length-1; i++) {
    //console.log(listCommand[i])
    if (listCommand[i] === 'Assign' && i === 0) {
        console.log(listCommand[1])
        console.log(mathjs.evaluate('A * 3', listCommand[1]))
    }
    else if (listCommand[i] === 'Assign2' && i === 0) {
        console.log(listCommand[1])
        console.log(mathjs.evaluate('A * 3', listCommand[1]))
    }
    else if (listCommand[i] === 'Derivative' && i === 0) {
        let functionBefore = String(listCommand[1])
        let functionLength = functionBefore.length
        //let functionAfter = functionBefore.substring(1, functionLength)
        let functionArgs = functionBefore.split("$")
        console.log(mathjs.derivative(functionArgs[1], functionArgs[2]))
        //console.log(mathjs.derivative(newAfter))

        //console.log(mathjs.evaluate(functionAfter))
    }
    else if (listCommand[i] === 'IntegrateVar' && i === 0) {
        console.log('(' + String(listCommand[i+1]) + ')^2/2')   
    }
    else if (listCommand[i] === 'IntegrateInt' && i === 0) {
        console.log(String(listCommand[i+1][0]) + 'x')
    }   
    else if (listCommand[i] === 'Assignment' && i === 0) {
        varName = String(listCommand[1])
        varNum = 2
        let scope = { varName:varNum }
        console.log(scope)
    }
}