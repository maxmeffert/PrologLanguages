% ==============================================================================
% Lexer Interface
% ==============================================================================

:- module(lexer, [
    lexer_from_string/2, 
    lexer_from_file/2, 
    lexer_dcg/3
    ]).

:- use_module(lexer/whitespaces).
:- use_module(lexer/tokenizer).

lexer_from_string(String,Tokens) :-
    string_codes(String, Chars),
    phrase(lexer_dcg(Tokens), Chars).

lexer_from_file(File,Tokens) :-
    phrase_from_file(lexer_dcg(Tokens), File).  

lexer_dcg([Token|T]) --> tokenizer_dcg(Token), !, lexer_dcg(T).
lexer_dcg(T) --> whitespace_dcg, !, lexer_dcg(T).
lexer_dcg([]) --> [], !.  