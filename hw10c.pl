
%----------------------------------------------------------------------
% Name:
% File: hw10c.pl
% Date: Spring 2021
% Desc:
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


% Question 2: my_init


% Question 3: my_replace


% Question 4: my_elem_sum


% Question 5: my_min


%----------------------------------------------------------------------

:- begin_tests(all_tests).

% Question 1 Tests
test(my_last_1) :- my_last([1],1), !.
test(my_last_2) :- my_last([1,2],2), !.
test(my_last_3) :- my_last([1,2,3],3), !.
test(my_last_4) :- \+ my_last([],_), !.

% Question 2 Tests


% Question 3 Tests


% Question 4 Tests


% Question 5 Tests


:- end_tests(all_tests).


