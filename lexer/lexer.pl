% ==============================================================================
% Lexer Interface
% ==============================================================================

:- module(lexer, [
    lexer_from_string/2, 
    lexer_from_file/2, 
    lexer/3
    ]).

:- use_module(lexer/common).
:- use_module(lexer/strings).
:- use_module(lexer/integers).
:- use_module(lexer/floats).
:- use_module(lexer/booleans).
:- use_module(lexer/keywords).
:- use_module(lexer/symbols).
:- use_module(lexer/identifiers).


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
