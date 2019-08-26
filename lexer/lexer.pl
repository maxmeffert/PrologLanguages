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
:- ensure_loaded('lexer.boolean.pl').
:- ensure_loaded('lexer.keyword.pl').
:- ensure_loaded('lexer.symbol.pl').
:- ensure_loaded('lexer.identifier.pl').


lexer_from_string(String,Tokens) :-
    stringCodes(String, Chars),
    phrase(lexer(Tokens), Chars).

lexer_from_file(File,Tokens) :-
    phrase_from_file(lexer(Tokens), File).  

% ==============================================================================
% Lexer DCG
% ==============================================================================

lexer([Token|T]) --> token(Token), !, lexer(T).
lexer(T) --> whitespace, !, lexer(T).
lexer([]) --> [], !.  

% ==============================================================================
% Tokens token(Kind,Value)
% ==============================================================================

token(token(string,Value)) --> tString(Value).
token(token(float,Value)) --> tFloat(Value).
token(token(integer,Value)) --> tInteger(Value).
token(token(boolean,Value)) --> tBoolean(Value).
token(token(keyword,Value)) --> tKeyword(Value).
token(token(symbol, Value)) --> tSymbol(Value).
token(token(identifier,Value)) --> tIdentifier(Value).
token(token(error,Value)) --> notWhitespace(Value).