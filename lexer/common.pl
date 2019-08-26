% ==============================================================================
%
% Character/Code Recognition Utils
%
% ==============================================================================

:- module(lexer_common, [
    codeInfo/2,
    stringCode/4,
    stringCodes/2,
    stringCodes/4,
    notStringCode/2,
    notStringCode/4,
    notStringCodes/2,
    notStringCodes/4
    ]).

% ------------------------------------------------------------------------------
% CodeInfo
% ------------------------------------------------------------------------------

codeInfo(Code,(Code,whitespace)) :- code_type(Code, space), !.
codeInfo(Code,(Code,whitespace)) :- code_type(Code, white), !.
codeInfo(Code,(Code,letter)) :- code_type(Code, alpha), !.
codeInfo(Code,(Code,digit)) :- code_type(Code, digit), !.


% ------------------------------------------------------------------------------
% String-Code Comparison
% ------------------------------------------------------------------------------

stringCode(String,Code) :- string_codes(String,[Code]).

stringCode(String,Code) --> [Code], { stringCode(String,Code) }.

stringCodes(String,Codes) :- string_codes(String,Codes).

stringCodes(String,Codes) --> Codes, { stringCodes(String,Codes) }.

notStringCode(String,Code) :- \+ stringCode(String,Code).

notStringCode(String,Code) --> [Code], { notStringCode(String,Code) }.

notStringCodes(String,Codes) :- \+ stringCodes(String,Codes).

notStringCodes(String,Codes) --> Codes, { notStringCodes(String,Codes) }.