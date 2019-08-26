% ==============================================================================
% String Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

doubleQuote(Code) --> code("\"", Code).

stringContent([S,Q]) --> codes("\\\"",[S,Q]).
stringContent([Q]) --> notCode("\"",Q).

stringContents([S,Q|QS]) --> stringContent([S,Q]), stringContents(QS).
stringContents([Q|QS]) --> stringContent([Q]), stringContents(QS).
stringContents([]) --> \+ stringContent(_).

stringLiteral(StringValue) --> doubleQuote(_), stringContents(Contents), doubleQuote(_), {
    string_codes(StringValue,Contents)
}.

tString(StringValue) --> stringLiteral(StringValue).