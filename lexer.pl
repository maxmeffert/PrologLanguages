% ==============================================================================
% Lexer Interface
% ==============================================================================

:- module(lexer, [
    lexer_from_string/2, 
    lexer_from_file/2, 
    lexer/3
    ]).

:- ensure_loaded('lexer.common.pl').
:- ensure_loaded('lexer.string.pl').
:- ensure_loaded('lexer.integer.pl').
:- ensure_loaded('lexer.float.pl').
:- ensure_loaded('lexer.identifier.pl').


lexer_from_string(String,Tokens) :-
    string_codes(String, Chars),
    phrase(lexer(Tokens), Chars).

lexer_from_file(File,Tokens) :-
    phrase_from_file(lexer(Tokens), File).  

% ==============================================================================
% Lexer DCG
% ==============================================================================

lexer([Token|T]) --> token(Token), !, lexer(T).
lexer(T) --> space, !, lexer(T).
lexer([]) --> [], !.  

% ==============================================================================
% Tokens
% ==============================================================================

% Literals
token(token(string,Value)) --> tString(Value).
token(token(float,Value)) --> tFloat(Value).
token(token(integer,Value)) --> tInteger(Value).
token(Token) --> tIdentifier(Identifier), {
    reservedWord(Identifier,Value) -> Token = Value ; Token = token(identifier,Identifier)  
}.
 
% Two Caracter Tokens
token(token("==")) --> "==".
token(token("!=")) --> "!=".
token(token("<=")) --> "<=".
token(token(">=")) --> ">=".

% One Character Tokens
token(token("=")) --> "=".
token(token("+")) --> "+".
token(token("-")) --> "-".
token(token("*")) --> "*".
token(token(".")) --> ".".
token(token(",")) --> ",".
token(token(";")) --> ";".
token(token(":")) --> ":".
token(token("~")) --> "~".
token(token("/")) --> "/".
token(token("\\")) --> "\\".
token(token("<")) --> "<".
token(token(">")) --> ">".
token(token("'")) --> "'".
token(token("\"")) --> "\"".
token(token("(")) --> "(".
token(token(")")) --> ")".
token(token("{")) --> "{".
token(token("}")) --> "}".

% Error Tokens
token(token(error,Value)) --> notspace(Value).

% Reserved Words and Keywords
reservedWord("true",token(boolean,true)).
reservedWord("false",token(boolean,false)).
reservedWord("if",token(keyword,if)).
reservedWord("else",token(keyword,else)).
reservedWord("while",token(keyword,while)).
reservedWord("var",token(keyword,var)).
