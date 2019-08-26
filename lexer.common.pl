% ==============================================================================
%
% Character/Code Recognition Utils
%
% ==============================================================================


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