% ==============================================================================
% Lexer Interface
% ==============================================================================

:- module(lexer, [
    lexer_from_string/2, 
    lexer_from_file/2, 
    lexer_dcg/3
    ]).

:- use_module(lexer/common).
:- use_module(lexer/whitespaces).
:- use_module(lexer/strings).
:- use_module(lexer/integers).
:- use_module(lexer/floats).
:- use_module(lexer/booleans).
:- use_module(lexer/keywords).
:- use_module(lexer/symbols).
:- use_module(lexer/identifiers).


lexer_from_string(String,Tokens) :-
    stringCodes(String, Chars),
    phrase(lexer_dcg(Tokens), Chars).

lexer_from_file(File,Tokens) :-
    phrase_from_file(lexer_dcg(Tokens), File).  

% ==============================================================================
% Lexer DCG
% ==============================================================================

lexer_dcg([Token|T]) --> token_dcg(Token), !, lexer_dcg(T).
lexer_dcg(T) --> whitespace, !, lexer_dcg(T).
lexer_dcg([]) --> [], !.  

% ==============================================================================
% Token DCG: token(Kind,Value)
% ==============================================================================

token_dcg(token(string,Value)) --> token_string_dcg(Value).
token_dcg(token(float,Value)) --> token_float_dcg(Value).
token_dcg(token(integer,Value)) --> token_integer_dcg(Value).
token_dcg(token(boolean,Value)) --> token_boolean_dcg(Value).
token_dcg(token(keyword,Value)) --> token_keyword_dcg(Value).
token_dcg(token(symbol, Value)) --> token_symbol_dcg(Value).
token_dcg(token(identifier,Value)) --> token_identifier_dcg(Value).
token_dcg(token(error,Value)) --> notWhitespace(Value).
