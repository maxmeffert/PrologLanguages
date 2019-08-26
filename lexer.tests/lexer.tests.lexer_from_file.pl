:- begin_tests(lexer_from_file).
:- ensure_loaded('../lexer/lexer.pl').

test(lexer_from_file) :- 
    lexer_from_file("lexer_test_file.txt",Tokens),
    assertion(Tokens=[token(keyword,while),token(keyword,if),token(string,"hello world.")]).
    
:- end_tests(lexer_from_file).