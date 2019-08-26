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
:- use_module(lexer/booleans).
:- use_module(lexer/keywords).
:- use_module(lexer/symbols).
:- use_module(lexer/identifiers).
    
tokenizer_dcg(token(string,Value)) --> token_string_dcg(Value).
tokenizer_dcg(token(boolean,Value)) --> token_boolean_dcg(Value).
tokenizer_dcg(token(keyword,Value)) --> token_keyword_dcg(Value).
tokenizer_dcg(token(symbol, Value)) --> token_symbol_dcg(Value).
tokenizer_dcg(token(float,Value)) --> token_float_dcg(Value).
tokenizer_dcg(token(integer,Value)) --> token_integer_dcg(Value).
tokenizer_dcg(token(identifier,Value)) --> token_identifier_dcg(Value).
tokenizer_dcg(token(error,Value)) --> not_whitespace_dcg(Value).
