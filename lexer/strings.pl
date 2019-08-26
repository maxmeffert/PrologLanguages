% ==============================================================================
% String Literals
% ==============================================================================

:- module(lexer_strings, [
        token_string_dcg/3
        ]).

:- use_module(lexer/common).

doubleQuote(Code) --> string_code_dcg("\"", Code).

stringContent([S,Q]) --> string_codes_dcg("\\\"",[S,Q]).
stringContent([Q]) --> not_string_code_dcg("\"",Q).

stringContents([S,Q|QS]) --> stringContent([S,Q]), stringContents(QS).
stringContents([Q|QS]) --> stringContent([Q]), stringContents(QS).
stringContents([]) --> \+ stringContent(_).

stringLiteral(StringValue) --> doubleQuote(_), stringContents(Contents), doubleQuote(_), {
    string_codes(StringValue,Contents)
}.

token_string_dcg(StringValue) --> stringLiteral(StringValue).