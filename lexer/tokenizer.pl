% ==============================================================================
% Tokenizer
% ==============================================================================

:- module(tokenizer, [
    tokenizer_dcg/3
    ]).
    
:- use_module(lexer/whitespaces).
:- use_module(lexer/strings).
:- use_module(lexer/integers).
:- use_module(lexer/floats).
:- use_module(lexer/symbols).
:- use_module(lexer/identifiers).
    
tokenizer_dcg(token(string,Value)) --> token_string_dcg(Value).
tokenizer_dcg(token(float,Value)) --> token_float_dcg(Value).
tokenizer_dcg(token(integer,Value)) --> token_integer_dcg(Value).
tokenizer_dcg(token(symbol,Value)) --> token_symbol_dcg(Value).
tokenizer_dcg(token(Kind,Value)) --> token_identifier_dcg(Identifier),
{
    identifier_keyword(Identifier,Kind,Value)
}.
tokenizer_dcg(token(error,Value)) --> not_whitespace_dcg(Value).

identifier_keyword(Identifier,keyword,Keyword) :- keyword(Identifier,Keyword).
identifier_keyword(Identifier,identifier,Identifier).

keyword(Identifier,Keyword) :-
    string_lower(Identifier, LowerCase),
    string_to_atom(LowerCase, Keyword),
    keyword(Keyword).

keyword(Keyword) :- 
    member(Keyword, [true, false, if, else, while, for]).