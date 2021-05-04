
%----------------------------------------------------------------------
% Name: Charles Walker
% File: hw10c.pl
% Date: 5/3 Spring 2021
% Desc: List functions in Prolog
%----------------------------------------------------------------------

%
% To run tests from command line use:
%   swipl -g run_tests -t halt hw10c.pl
%
% Alternatively, do:
%   swipl hw10c.pl
%   ?- run_tests.
%
% Note that after running swipl hw10c.pl from the command line, your
% source file is loaded into the interpreter and you can do basic
% tests there for debugging.
%


% Question 1: my_last
my_last([X], X).
my_last([_|T], X) :- my_last(T,X).

% Question 2: my_init
my_init([],[]).
my_init([_],[]).
my_init([H|T],[H| NewT]) :- my_init(T,NewT).

append([], Ys, Ys).
append([H|T], Ys, [H| NewT]) :- append(T,Ys,NewT). 


% Question 3: my_replace
my_replace((_,_),[],[]).
my_replace((A,B),[H|T],[B| NewT]) :- H == A, my_replace((A,B),T,NewT).
my_replace((A,B),[H|T],[H| NewT]) :- my_replace((A,B),T,NewT).


% Question 4: my_elem_sum
my_elem_sum(_,[],0).
my_elem_sum(X, [H|T], Sum) :- H == X, my_elem_sum(X, T, Sum2), Sum is Sum2 + X.
my_elem_sum(X, [_|T], Sum) :- my_elem_sum(X, T, Sum).



% Question 5: my_min
my_min([H|T], M) :- min_rec([H|T], H, M2), M = M2.
min_rec([], _, _).
min_rec([H|T], M, _) :- H < M, min_rec(T, H, H).
min_rec([_|T], M, _) :- min_rec(T, M, M).



%----------------------------------------------------------------------

:- begin_tests(all_tests).

% Question 1 Tests
test(my_last_1) :- my_last([1],1), !.
test(my_last_2) :- my_last([1,2],2), !.
test(my_last_3) :- my_last([1,2,3],3), !.
test(my_last_4) :- \+ my_last([],_), !.

% Question 2 Tests
test(my_init_1) :- my_init([1,2,3,4],[1,2,3]), !.
test(my_init_2) :- my_init([],[]), !.
test(my_init_3) :- my_init([1],[]), !.

% Question 3 Tests
test(my_replace_1) :- my_replace((8,2),[1,8,3,8],[1,2,3,2]), !.
test(my_replace_2) :- my_replace((2,8),[],[]), !.
test(my_replace_3) :- my_replace((2,8),[1,3,3,3],[1,3,3,3]), !.
test(my_replace_1) :- my_replace((0,1),[0,0,2,0,0,2,0],[1,1,2,1,1,2,1]), !.

% Question 4 Tests
test(my_elem_sum_1) :- my_elem_sum(10, [], 0), !.
test(my_elem_sum_2) :- my_elem_sum(2, [1,2,3,2], 4), !.
test(my_elem_sum_3) :- my_elem_sum(10, [1,2,3,4], 0), !.

% Question 5 Tests


:- end_tests(all_tests).


