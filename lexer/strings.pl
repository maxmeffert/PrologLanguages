% ==============================================================================
% String Literals
% ==============================================================================

:- module(lexer_strings, [
        token_string_dcg/3
        ]).

:- use_module(lexer/common).

double_quote_dcg(Code) --> string_code_dcg("\"", Code).

string_content_dcg([Code1,Code2]) --> string_codes_dcg("\\\"",[Code1,Code2]).
string_content_dcg([Code]) --> not_string_code_dcg("\"",Code).

string_contents_dcg([Code1,Code2|Codes]) --> string_content_dcg([Code1,Code2]), string_contents_dcg(Codes).
string_contents_dcg([Code|Codes]) --> string_content_dcg([Code]), string_contents_dcg(Codes).
string_contents_dcg([]) --> \+ string_content_dcg(_).

string_literal_dcg(String) --> double_quote_dcg(_), string_contents_dcg(Codes), double_quote_dcg(_), {
    string_codes(String,Codes)
}.

token_string_dcg(String) --> string_literal_dcg(String).