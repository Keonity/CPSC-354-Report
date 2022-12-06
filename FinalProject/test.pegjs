// Simple Arithmetics Grammar
// ==========================
//
// Accepts expressions like "2 * (3 + 4)" and computes their value.

Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Factor tail:(_ ("*" / "/") _ Factor)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Factor
  = "(" _ expr:Expression _ ")" { return "9"; }
  / Integer
  / Variable
  / Integrate

Integrate
  = "~" _ expr:Expression _ "~" { 
    var myArr = expr.toString().split(' ');
    let newStr = '';
    for (const x of myArr) {
      if (!isNaN(parseInt(x, 10))) { newStr += + x.toString() + 'x'; }
    }
    return newStr;
    }

Variable "variable"
  = _ [a-zA-Z]+ { return text() }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*