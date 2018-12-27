:- begin_tests(lexer).
:- ['lexer.pl'].

test(emptyString) :- 
    lexer("",Tokens),
    assertion(Tokens=[]).

test(space) :- 
    lexer(" ",Tokens),
    assertion(Tokens=[]).

test(tab) :- 
    lexer("\t",Tokens),
    assertion(Tokens=[]).

test(carriagereturn) :- 
    lexer("\r",Tokens),
    assertion(Tokens=[]).

test(newline) :- 
    lexer("\n",Tokens),
    assertion(Tokens=[]).

test(whitespace) :- 
    lexer(" \t\t\r\n  ",Tokens),
    assertion(Tokens=[]).

test(bool_true) :- 
    lexer("true",Tokens),
    assertion(Tokens=[tBool(true)]).

test(bool_false) :- 
    lexer("false",Tokens),
    assertion(Tokens=[tBool(false)]).

test(bool_error) :- 
    lexer("truefalse",Tokens),
    assertion(Tokens=[tError("truefalse")]).

test(bool_true_false) :- 
    lexer("true false",Tokens),
    assertion(Tokens=[tBool(true),tBool(false)]).

test(integer_unsigned) :- 
    lexer("1",Tokens),
    assertion(Tokens=[tInteger(1)]).

test(integer_signed_positive) :- 
    lexer("+10",Tokens),
    assertion(Tokens=[tPlus,tInteger(10)]).

test(integer_signed_negative) :- 
    lexer("-1258",Tokens),
    assertion(Tokens=[tMinus,tInteger(1258)]).

test(float_unsigned) :- 
    lexer("1.0",Tokens),
    assertion(Tokens=[tFloat(1.0)]).

test(float_signed_positive) :- 
    lexer("+10.3",Tokens),
    assertion(Tokens=[tPlus,tFloat(10.3)]).

test(float_signed_negative) :- 
    lexer("-14.344",Tokens),
    assertion(Tokens=[tMinus,tFloat(14.344)]).

test(float_unsigned_nofraction_exponent_unsigned) :- 
    lexer("1e2",Tokens),
    assertion(Tokens=[tFloat(100.0)]).

test(float_unsigned_nofraction_exponent_signed_positive) :- 
    lexer("1e+2",Tokens),
    assertion(Tokens=[tFloat(100.0)]).

test(float_unsigned_nofraction_exponent_signed_negative) :- 
    lexer("1e-2",Tokens),
    assertion(Tokens=[tFloat(0.01)]).

test(float_signed_positive_nofraction_exponent_signed_negative) :- 
    lexer("+10e-5",Tokens),
    assertion(Tokens=[tPlus,tFloat(0.0001)]).

test(float_signed_negative_nofraction_exponent_signed_positive) :- 
    lexer("-1258e+4",Tokens),
    assertion(Tokens=[tMinus,tFloat(12580000.0)]).

test(float_unsigned_withfraction_exponent_unsigned) :- 
    lexer("1.33e+2",Tokens),
    assertion(Tokens=[tFloat(133.0)]).

test(float_signed_positive_withfraction_exponent_signed_negative) :- 
    lexer("+10.000e-5",Tokens),
    assertion(Tokens=[tPlus,tFloat(0.0001)]).

test(float_signed_negative_withfraction_exponent_signed_positive) :- 
    lexer("-1258.48e+4",Tokens),
    assertion(Tokens=[tMinus,tFloat(12584800.0)]).

test(string) :-
    lexer("\"asdf\"",Tokens),
    assertion(Tokens=[tString("asdf")]).

test(string_space) :-
    lexer("\" \" ",Tokens),
    assertion(Tokens=[tString(" ")]).

test(string_with_escaped_quote) :-
    lexer("\"as\\\"df\"",Tokens),
    assertion(Tokens=[tString("as\\\"df")]).

test(string_with_escaped_quotes) :-
    lexer("\"a\\\"s\\\"df\"",Tokens),
    assertion(Tokens=[tString("a\\\"s\\\"df")]).

test(some_expression) :- 
    lexer("1-10",Tokens),
    assertion(Tokens=[tInteger(1),tMinus,tInteger(10)]).
    
test(some_expression) :- 
    lexer("1+10",Tokens),
    assertion(Tokens=[tInteger(1),tPlus,tInteger(10)]).
    

:- end_tests(lexer).