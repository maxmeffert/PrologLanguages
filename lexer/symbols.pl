% ==============================================================================
% Symbolic Literals
% ==============================================================================

:- module(lexer_symbols, [
        token_symbol_dcg/3
        ]).

:- use_module(lexer/common).

% Two Caracter Tokens
token_symbol_dcg("==") --> "==".
token_symbol_dcg("!=") --> "!=".
token_symbol_dcg("<=") --> "<=".
token_symbol_dcg(">=") --> ">=".

% One Character Tokens
token_symbol_dcg("=") --> "=".
token_symbol_dcg("+") --> "+".
token_symbol_dcg("-") --> "-".
token_symbol_dcg("*") --> "*".
token_symbol_dcg(".") --> ".".
token_symbol_dcg(",") --> ",".
token_symbol_dcg(";") --> ";".
token_symbol_dcg(":") --> ":".
token_symbol_dcg("~") --> "~".
token_symbol_dcg("/") --> "/".
token_symbol_dcg("\\") --> "\\".
token_symbol_dcg("<") --> "<".
token_symbol_dcg(">") --> ">".
token_symbol_dcg("'") --> "'".
token_symbol_dcg("\"") --> "\"".
token_symbol_dcg("(") --> "(".
token_symbol_dcg(")") --> ")".
token_symbol_dcg("{") --> "{".
token_symbol_dcg("}") --> "}".

