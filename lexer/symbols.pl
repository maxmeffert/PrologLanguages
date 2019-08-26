% ==============================================================================
% Symbolic Literals
% ==============================================================================

:- module(lexer_symbols, [
        tSymbol/3
        ]).

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

