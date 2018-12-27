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

code(String,Code) --> [Code], { string_codes(String,[Code]) }.

% ==============================================================================
% Strings
% ==============================================================================

doubleQuote(Code) --> code("\"", Code).

stringContent([S,Q]) --> [S,Q], {[S,Q] = [92,34]}.
stringContent([Q]) --> [Q], {\+ [Q] = [34]}.

stringContents([S,Q|QS]) --> stringContent([S,Q]), stringContents(QS).
stringContents([Q|QS]) --> stringContent([Q]), stringContents(QS).
stringContents([]) --> \+ stringContent(_).

tString(StringValue) --> doubleQuote(_), stringContents(Contents), doubleQuote(_), {
    string_codes(StringValue,Contents)
}.

% ==============================================================================
% Integers Numbers
% ==============================================================================

sign(Code) --> code("+",Code).
sign(Code) --> code("-",Code).

signedIntegerLiteral([S,D|DS]) --> sign(S), digit(D), digits(DS).
integerLiteral([D|DS]) --> digit(D), digits(DS).

tInteger(IntegerValue) --> integerLiteral(IntegerLiteral), {
    number_string(IntegerValue,IntegerLiteral)
}.

% ==============================================================================
% Floating Point Numbers
% ==============================================================================

floatDecimalPoint(Code) --> code(".",Code).
floatExponent(Code) --> code("e",Code).

floatFractionLiteral([P,D|DS]) --> floatDecimalPoint(P), digit(D), digits(DS).

floatExponentLiteral([FloatExponent|IntegerLiteral]) --> floatExponent(FloatExponent), signedIntegerLiteral(IntegerLiteral).
floatExponentLiteral([FloatExponent|IntegerLiteral]) --> floatExponent(FloatExponent), integerLiteral(IntegerLiteral).


floatLiteral(FloatLiteral) --> integerLiteral(IntegerLiteral), floatFractionLiteral(FloatFractionLiteral), floatExponentLiteral(FloatExponentLiteral), {
    append(IntegerLiteral,FloatFractionLiteral,X),
    append(X,FloatExponentLiteral,FloatLiteral)
}.
floatLiteral(FloatLiteral) --> integerLiteral(IntegerLiteral), floatFractionLiteral(FloatFractionLiteral), {
    append(IntegerLiteral,FloatFractionLiteral,FloatLiteral)
}.
floatLiteral(FloatLiteral) --> integerLiteral(IntegerLiteral), floatExponentLiteral(FloatExponentLiteral), {
    append(IntegerLiteral,FloatExponentLiteral,FloatLiteral)
}.

tFloat(FloatValue) --> floatLiteral(FloatLiteral), {
    number_string(FloatValue,FloatLiteral)
}.

% ==============================================================================
% Booleans
% ==============================================================================

tBool(true) --> "true".
tBool(false) --> "false".

% ==============================================================================
% Tokens
% ==============================================================================

token(tString(Value)) --> tString(Value).
token(tFloat(Value)) --> tFloat(Value).
token(tInteger(Value)) --> tInteger(Value).
token(tBool(Value)) --> tBool(Value).
token(tWhile) --> "while".
token(tIf) --> "if". 
token(tElse) --> "else".
token(tEqual) --> "==".
token(tAssign) --> "=".
token(tPlus) --> "+".
token(tMinus) --> "-".
token(tAsterisk) --> "*".
token(tPeriod) --> ".".
token(tComma) --> ",".
token(tSemicolon) --> ";".
token(tQuote) --> ",".
token(tDouleQuote) --> "\"".
token(tError(NSpace)) --> notspace(NSpace).

% ==============================================================================
% Lexer
% ==============================================================================

lexer([Token|T]) --> token(Token), !, lexer(T).
lexer(T) --> space, !, lexer(T).
lexer([]) --> [], !.

lexer(String,Tokens) :-
    string(String),
    string_codes(String,Chars),
    lexer(Tokens,Chars,[]).
