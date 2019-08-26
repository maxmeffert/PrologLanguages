:- begin_tests(lexer_common).
:- ensure_loaded('../lexer/lexer.common.pl').

test(whitespace_succeeds_for_space_string) :- 
    string_codes(" ", [Code]),
    whitespace(Code).

test(whitespace_succeeds_for_tab_string) :- 
    string_codes("\t",[Code]),
    whitespace(Code).

test(whitespace_succeeds_for_carriagereturn_string) :- 
    string_codes("\r",[Code]),
    whitespace(Code).

test(whitespace_succeeds_for_newline_string) :- 
    string_codes("\n",[Code]),
    whitespace(Code).

test(whitespace_succieds_for_all_space_or_white_codes,[
    forall( code_type(Code,space) ; code_type(Code, white))
    ]) :-
    whitespace(Code).

test(whitespace_fails_for_all_alphanumeric_codes, [
    fail,
    forall( code_type(Code, alnum) )
    ]) :-
    whitespace(Code).

test(whitespaces_succeeds_for_whitespace_codes) :- 
    string_codes(" \t\t\r\n  ",Codes),
    whitespaces(Codes).

test(whitespaces_fails_for_any_nonwhitespace_code, fail) :- 
    string_codes(" \t\ta\r\n  ",Codes),
    whitespaces(Codes).

test(letter_succeeds_for_all_alpha_codes,[
    forall( code_type(Code, alpha) )
    ]) :-     
    letter(Code).

test(letter_fails_for_all_white_codes,[
    fail,
    forall( code_type(Code, white)  )
    ]) :-     
    letter(Code).

test(letter_fails_for_all_space_codes,[
    fail,
    forall( code_type(Code, space)  )
    ]) :-     
    letter(Code).

test(letter_fails_for_all_digit_codes,[
    fail,
    forall( code_type(Code, digit) )
    ]) :-     
    letter(Code).

test(digit_succeeds_for_all_digit_strings,[
    forall( member(String, ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]) )
    ]) :-     
    string_codes(String,[Code]),
    digit(Code).

test(digit_succeeds_for_all_digit_codes,[
    forall( code_type(Code, digit) )
    ]) :-     
    digit(Code).

:- end_tests(lexer_common).
