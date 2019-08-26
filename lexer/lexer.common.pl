% ==============================================================================
%
% Character/Code Recognition Utils
%
% ==============================================================================

:- module(lexer_common, [
    whitespace/1,
    whitespace/2,
    whitespace/3,
    whitespaces/1,
    whitespaces/3,
    notWhitespace/3,
    notWhitespaces/3,
    digit/1,
    digit/3,
    digits/3,
    letter/1,
    letter/3,
    letters/3,
    letterOrDigit/1,
    letterOrDigit/3,
    lettersOrDigits/3,
    stringCode/2,
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
% Whitespaces
% ------------------------------------------------------------------------------

whitespace(Code) :- codeInfo(Code, (Code,whitespace)).

whitespaces([]).
whitespaces([Code|Codes]) :- 
    whitespace(Code), 
    whitespaces(Codes).

notWhitespace(Code) :- \+ whitespace(Code).

whitespace --> [Code], { whitespace(Code) }.
whitespace(Code) --> [Code], { whitespace(Code) }.

whitespaces([Code|Codes]) --> whitespace(Code), whitespaces(Codes).
whitespaces([]) --> \+ whitespace(_).

notWhitespace(Code) --> [Code], { notWhitespace(Code) }.
notWhitespaces([Code|Codes]) --> notWhitespace(Code), notWhitespaces(Codes).
notWhitespaces([]) --> \+ notWhitespace(_).

% ------------------------------------------------------------------------------
% Digits
% ------------------------------------------------------------------------------

digit(Code) :- codeInfo(Code, (Code,digit)).

digit(Code) --> [Code], { digit(Code) }.

digits([Code|Codes]) --> digit(Code), digits(Codes).
digits([]) --> \+ digit(_).

% ------------------------------------------------------------------------------
% Letters
% ------------------------------------------------------------------------------

letter(Code) :- codeInfo(Code, (Code,letter)).

letter(Code) --> [Code], { letter(Code) }.

letters([Code|Codes]) --> letter(Code), letters(Codes).
letters([]) --> \+ letter(_).

% ------------------------------------------------------------------------------
% Letters or Digits
% ------------------------------------------------------------------------------

letterOrDigit(Code) :- letter(Code) ; digit(Code).

letterOrDigit(Code) --> [Code], { letterOrDigit(Code) }.

lettersOrDigits([Code|Codes]) --> letterOrDigit(Code), lettersOrDigits(Codes).
lettersOrDigits([]) --> \+ letterOrDigit(_).


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