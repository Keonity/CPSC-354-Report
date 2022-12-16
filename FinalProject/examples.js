//import * as mathjs from 'mathjs';

var parser = require('./test.js');

const mathjs = require('mathjs')
const listCommand = (parser.parse("~A"));
console.log(listCommand)
for (let i = 0; i<listCommand.length-1; i++) {
    //console.log(listCommand[i])
    if (listCommand[i] === 'Assign' && i === 0) {
        console.log(listCommand[1])
        console.log(mathjs.evaluate('A * 3', scope))
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