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

space --> [Code], { whitespace(Code) }.
space(Code) --> [Code], { whitespace(Code) }.

spaces([Code|Codes]) --> space(Code), spaces(Codes).
spaces([]) --> \+ space(_).

notspace(Code) --> [Code], { notWhitespace(Code) }.
notspaces([Code|Codes]) --> notspace(Code), notspaces(Codes).
notspaces([]) --> \+ notspace(_).

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

code(String,Code) --> [Code], { string_codes(String,[Code]) }.
codes(String,Codes) --> Codes, { string_codes(String,Codes) }.

notCode(String,Code) --> [Code], { string_codes(String,[C]), \+ C = Code }.
notCodes(String,Codes) --> Codes, { string_codes(String,CS), \+ CS = Codes }.