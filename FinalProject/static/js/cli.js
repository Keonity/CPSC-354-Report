import * as math from 'mathjs';
import { parse } from './test.js';
import promptsync from 'prompt-sync'
const prompt = promptsync();

console.log('Welcome to the FALL 2022 CPSC-354 PEG.JS Calculator Extension')
console.log('Please enter a statement you would like to be parsed.')
console.log('We accept statements following this grammar: ')
console.log('Integer (+, -, *, /, ^) Integer (Basic Arithmetic')
console.log('~Variable/~Variable^Integer (Integrate Variable)')
console.log('`Constant (Integrate Constant)')
console.log('_$Expression$WithRespectTo$_ (Derivative)')

const expression = prompt('Your expression is: ')
const parsedResult = parse(expression)
console.log('You entered: ' + String(expression))
//console.log(parsedResult[0])

if (parsedResult[0] === 'Derivative') {
    let inputFunc = String(parsedResult[1])
    let functionArgs = inputFunc.split("$")
    console.log(functionArgs)
    console.log(String(math.derivative((functionArgs[1]), (functionArgs[2]))))
}
else if (parsedResult[0] === 'IntegrateInt') {
    console.log(String(parsedResult[1][0]) + 'x + C')
}
else if (parsedResult[0] === 'IntegrateVar') {
    if (parsedResult[2][0] === undefined) {
        console.log('(' + String(parsedResult[1]) + ')^2/2')
    }
    else {
        console.log('(' + String(parsedResult[1]) + ')^' + String(parsedResult[2][0]+1) + '/' + String(parsedResult[2][0]+1))  
    }
}
else {
    console.log('Parsed Result: ' + parse(expression))
}

//console.log('Parsed Result: ' + parse(expression))