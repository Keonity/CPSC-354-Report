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
  = head:Start tail:(_ ("*" / "/") _ Start)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Start
  = "(" _ expr:Expression _ ")" { return expr; }
  / Integer
  / Variable

Variable "variable"
  = _ [a-zA-Z]+ { return text() }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*