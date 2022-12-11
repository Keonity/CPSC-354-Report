var parser = require('./test.js');

const listCommand = (parser.parse("2^2"));
console.log(listCommand)
/*for (let i = 0; i<listCommand.length-1; i++) {
    //console.log(listCommand[i])
    if (listCommand[i] === 'assign' && i === 0) {
        var varName = String(listCommand[i+1])
        eval("var" + String(listCommand[i+1]) + "=" + String(listCommand[i+3] + ";"))
        console.log(String(listCommand[i+1]))
        //eval(listCommand[i+1])
    }
    else if (listCommand[i] === 'IntegrateVar' && i == 0) {
        console.log(String(listCommand[i+1]) + '^2/2')
        
    }
}*/