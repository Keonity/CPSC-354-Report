var parser = require('./test.js');

function mainFunction() {
    const listCommand = (parser.parse("~X"))
    console.log(listCommand)
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
            //console.log(mathjs.derivative(newAfter))
            console.log(functionArgs)
            //console.log(mathjs.evaluate(functionAfter))
        }
        else if (listCommand[i] === 'IntegrateExp' && i === 0) {
            console.log("Test")
            alert("Test")
            //return document.body.innerHTML("<h2>Test</h2>")
        }
        else if (listCommand[i] === 'IntegrateVar' && i === 0) {
            //console.log(typeof(listCommand[2][0]))
            if (listCommand[2][0] === undefined) {
                console.log('(' + String(listCommand[i+1]) + ')^2/2')
            }
            else {
                console.log('(' + String(listCommand[i+1]) + ')^' + String(listCommand[i+2][0]+1) + '/' + String(listCommand[i+2][0]+1))  
            }
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
}

mainFunction()