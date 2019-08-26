% ==============================================================================
% Symbolic Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

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

