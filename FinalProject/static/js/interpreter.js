import { parse } from './test.js';
import * as math from 'mathjs';


export function parseGrammar(expression) {
    console.log('Please enter a statement you would like parsed.')
    console.log('Statement to be parsed: ' + expression)
    const listCommand = (parse(expression))
    console.log('Parsed and interpreted result: ' + listCommand)
    window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(listCommand)
    //console.log(mathjs.integral('x^2', 'x'))
    for (let i = 0; i<listCommand.length-1; i++) {
        //console.log(listCommand[i])
        if (listCommand[i] === 'Assign' && i === 0) {
            console.log(listCommand[1])
        }
        else if (listCommand[i] === 'Assign2' && i === 0) {
            console.log(listCommand[1])
        }
        else if (listCommand[i] === 'Derivative' && i === 0) {
            let functionBefore = String(listCommand[1])
            //let functionLength = functionBefore.length
            //let functionAfter = functionBefore.substring(1, functionLength)
            let functionArgs = functionBefore.split("$")
            console.log("Calculator output: " + String(math.derivative((functionArgs[1]), functionArgs[2])))
            console.log(functionArgs)
            //console.log(mathjs.evaluate(functionAfter))
            window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(math.derivative((functionArgs[1]), functionArgs[2]))
        }
        else if (listCommand[i] === 'IntegrateExp' && i === 0) {
            console.log("Test")
            //alert("Test")
            //return document.body.innerHTML("<h2>Test</h2>")
            window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(listCommand)
        }
        else if (listCommand[i] === 'IntegrateVar' && i === 0) {
            //console.log(typeof(listCommand[2][0]))
            if (listCommand[2][0] === undefined) {
                console.log("Calculator output: " + '(' + String(listCommand[i+1]) + ')^2/2')
                window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + '(' + String(listCommand[i+1]) + ')^2/2'
            }
            else {
                console.log("Calculator output: " + '(' + String(listCommand[i+1]) + ')^' + String(listCommand[i+2][0]+1) + '/' + String(listCommand[i+2][0]+1))  
                window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + '(' + String(listCommand[i+1]) + ')^' + String(listCommand[i+2][0]+1) + '/' + String(listCommand[i+2][0]+1)
            }
            //window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(listCommand)
        }
        else if (listCommand[i] === 'IntegrateInt' && i === 0) {
            console.log("Calculator output: " + String(listCommand[i+1][0]) + 'x + C')
            window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(listCommand[i+1][0]) + 'x + C'
        }   
        else if (listCommand[i] === 'Assignment' && i === 0) {
            varName = String(listCommand[1])
            //varNum = 2
            //let scope = { newVar:varNum }
            console.log("Calculator output: " + varName)
            //window.document.getElementById("calcOutput").innerHTML = "Calculator Output: " + String(listCommand)
        }
        else { 
            console.log(listCommand)
            //window.document.getElementById("calcOutput").innerHTML = "Calculator Output: lol"
        }
    }
}


const textInp = document.getElementById("statement").value
const textChg = document.getElementById("statement");
textChg.oninput = console.log(parseGrammar(textInp))

window.parseGrammar= parseGrammar;

parseGrammar("2^0")