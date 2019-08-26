% ==============================================================================
%
% Character/Code Recognition Utils
%
% ==============================================================================

% ------------------------------------------------------------------------------
% Whitespaces
% ------------------------------------------------------------------------------

whitespace(Code) :- code_type(Code, space).
notWhitespace(Code) :- \+ code_type(Code, space).

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

digit(Code) :- code_type(Code,digit).

digit(Code) --> [Code], { digit(Code) }.

digits([Code|Codes]) --> digit(Code), digits(Codes).
digits([]) --> \+ digit(_).

% ------------------------------------------------------------------------------
% Letters
% ------------------------------------------------------------------------------

letter(Code) :- code_type(Code,alpha).

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

stringCode(String,Code) --> [Code], { string_codes(String,[Code]) }.
stringCodes(String,Codes) --> Codes, { string_codes(String,Codes) }.

notStringCode(String,Code) --> [Code], { string_codes(String,[C]), \+ C = Code }.
notStringCodes(String,Codes) --> Codes, { string_codes(String,CS), \+ CS = Codes }.