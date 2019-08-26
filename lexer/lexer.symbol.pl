% ==============================================================================
% Symbolic Literals
% ==============================================================================

:- use_module(lexer/common).

% Two Caracter Tokens
tSymbol("==") --> "==".
tSymbol("!=") --> "!=".
tSymbol("<=") --> "<=".
tSymbol(">=") --> ">=".

% One Character Tokens
tSymbol("=") --> "=".
tSymbol("+") --> "+".
tSymbol("-") --> "-".
tSymbol("*") --> "*".
tSymbol(".") --> ".".
tSymbol(",") --> ",".
tSymbol(";") --> ";".
tSymbol(":") --> ":".
tSymbol("~") --> "~".
tSymbol("/") --> "/".
tSymbol("\\") --> "\\".
tSymbol("<") --> "<".
tSymbol(">") --> ">".
tSymbol("'") --> "'".
tSymbol("\"") --> "\"".
tSymbol("(") --> "(".
tSymbol(")") --> ")".
tSymbol("{") --> "{".
tSymbol("}") --> "}".

