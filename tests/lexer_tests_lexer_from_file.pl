:- begin_tests(lexer_from_file).
:- use_module(lexer/lexer).


test(lexer_from_file) :- 
    lexer_from_file("./tests/lexer_test_file.txt",Tokens),
    assertion(Tokens=[token(keyword,while),token(keyword,if),token(string,"hello world.")]).
    
:- end_tests(lexer_from_file).