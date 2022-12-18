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

  function newVar(x, y) {
    const scope = { x:y }
    return scope;
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
  = head:Exponentiation tail:(_ ("*" / "/" / "%") _ Exponentiation)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
          //if (element[3] === "x") 
           // if (head.toString() === ('~' + tail + '~')) { return result.toString() + "*" + "x^2/2"; }
        if (element[1] === "/") { return result / element[3]; }
        if (element[1] === "%") { return result % element[3]; }
      }, head);
    }
    

Exponentiation
  = head:Factor tail:(_ "^" _ Factor)* { 
      return tail.reduce(function(result, element) {
        { return Math.pow(result, element[3]) ; }
      }, head);
    }
  
Factor
  = "(" _ expr:Expression _ ")" { return expr; }
  / Assign
  / Integer
  / Variable
  / IntegrateInt
  / IntegrateVar
  / IntegrateExp
  / Application
  / Derivative
  / DefIntegral

Application
 = "$" _ expr:Expression "$" _ expr2:Expression "$" { return ['Application', expr, expr2]; }

Derivative
 = "_" expr:Expression "_" { return ['Derivative', text()]; }

DefIntegral
 = "." expr:Expression "$" intA:Integer "$" intB:Integer "." { return ['DefIntegral', text(), intA, intB]; }

IntegrateExp
  = "/" _ expr:Expression _ "/" { return ['IntegrateExp', text()]}

Assign
  = _ varA:Variable+ ":" _ intA:Integer+ { return ['Assign', newVar(varA, intA)]; }

Assignment2
  = "{" _ varA:Variable+ ":" _ intA:Integer+ "}" { return text(); }

IntegrateVar 
  = "~" _ varA:Variable+ "^"* _ intA:Integer* { return ['IntegrateVar', varA, intA]; }

IntegrateInt
  = "`" _ intA:Integer+ { return ['IntegrateInt', intA]; }


Variable "variable"
  = _ [a-zA-Z]+ { return text(); }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*