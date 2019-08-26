% ==============================================================================
% String Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

doubleQuote(Code) --> stringCode("\"", Code).

stringContent([S,Q]) --> stringCodes("\\\"",[S,Q]).
stringContent([Q]) --> notStringCode("\"",Q).

stringContents([S,Q|QS]) --> stringContent([S,Q]), stringContents(QS).
stringContents([Q|QS]) --> stringContent([Q]), stringContents(QS).
stringContents([]) --> \+ stringContent(_).

stringLiteral(StringValue) --> doubleQuote(_), stringContents(Contents), doubleQuote(_), {
    string_codes(StringValue,Contents)
}.

tString(StringValue) --> stringLiteral(StringValue).