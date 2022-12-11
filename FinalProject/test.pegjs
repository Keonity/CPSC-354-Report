// Simple Arithmetics Grammar
// ==========================
//
// Accepts expressions like "2 * (3 + 4)" and computes their value.

{
  function toString(x) {
    return x.toString();
  }

  function test(x) {
    if (x === "934 * 3") { return "9"; }
    else { return x; }
  }
}

Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Exponentiation tail:(_ ("*" / "/") _ Exponentiation)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
          //if (element[3] === "x") 
           // if (head.toString() === ('~' + tail + '~')) { return result.toString() + "*" + "x^2/2"; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Exponentiation
  = head:Factor "^" tail:Factor { return Math.pow(head, tail); }

Factor
  = "(" _ expr:Expression _ ")" { return expr; }
  / Integer
  / Variable

Calculus
  = "~" calc:[0-9] "~" { 
    return toString(calc);

    //let newStr = '';
    //myArr.forEach(function(x) {
    //  if (!isNaN(parseInt(x, 10))) { newStr = newStr + x.toString() + 'x'; }
    //  else if (x === 'x') { newStr = newStr + '(' + x + '^2)/2' ; }
    //  else { newStr = newStr + 'LOL'; }
    //});

    //return newStr;
  }

// Parse expressions to certain strings such as "~A" = integrate A
// Correspond integrate A to a function integrate(A)
// Print correct text based on that function

Assignment "assignment"
  = varA:Variable _ "=" _ intA:Integer { return ['assign', varA, 'to', intA.toString()]; }

IntegrateVar = 
  "~" varA:Variable { return ['IntegrateVar', varA]; }

IntegrateInt = 
  "~" intA:Integer { return ['IntegrateInt', intA]; }

Variable "variable"
  = _ [a-zA-Z]+ { return text(); }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*