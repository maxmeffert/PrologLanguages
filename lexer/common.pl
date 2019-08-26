% ==============================================================================
%
% Character/Code Recognition Utils
%
% ==============================================================================

:- module(lexer_common, [
    string_code/2,
    not_string_code/2,
    not_string_codes/2,
    string_code_dcg/4,
    string_codes_dcg/4,
    not_string_code_dcg/4,
    not_string_codes_dcg/4
    ]).


string_code(String,Code) :- string_codes(String,[Code]).

not_string_code(String,Code) :- \+ string_code(String,Code).

not_string_codes(String,Codes) :- \+ string_codes(String,Codes).


string_code_dcg(String,Code) --> [Code], { string_code(String,Code) }.

string_codes_dcg(String,Codes) --> Codes, { string_codes(String,Codes) }.

not_string_code_dcg(String,Code) --> [Code], { not_string_code(String,Code) }.

not_string_codes_dcg(String,Codes) --> Codes, { not_string_codes(String,Codes) }.