% ==============================================================================
% Character/Code Recognition Utils
% ==============================================================================

space --> [S], { code_type(S, space) }.
space(S) --> [S], { code_type(S, space) }.
spaces([S|SS]) --> space(S), spaces(SS).
spaces([]) --> \+ space(_).

notspace(S) --> [S], { \+ code_type(S,space) }.
notspaces([S|SS]) --> notspace(S), notspaces(SS).
notspaces([]) --> \+ notspace(_).

digit(D) --> [D], { code_type(D, digit) }.
digits([D|DS]) --> digit(D), digits(DS).
digits([]) --> \+ digit(_).

letter(L) --> [L], { code_type(L, alpha) }.
letters([L|LS]) --> letter(L), letters(LS).
letters([]) --> \+ letter(_).

letterOrDigit(X) --> [X], { code_type(X,digit) ; code_type(X,alpha) }.
lettersOrDigits([X|XS]) --> letterOrDigit(X), lettersOrDigits(XS).
lettersOrDigits([]) --> \+ letterOrDigit(_).

code(String,Code) --> [Code], { string_codes(String,[Code]) }.
codes(String,Codes) --> Codes, { string_codes(String,Codes) }.
notCode(String,Code) --> [Code], { string_codes(String,[C]), \+ C = Code }.
notCodes(String,Codes) --> Codes, { string_codes(String,CS), \+ CS = Codes }.