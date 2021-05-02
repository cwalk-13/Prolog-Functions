
%----------------------------------------------------------------------
% Name:
% File: hw10b.pl
% Date: Spring 2021
% Desc:
%----------------------------------------------------------------------

%
% To run tests from command line use:
%   swipl -g run_tests -t halt hw10b.pl
%
% Alternatively, do:
%   swipl hw10b.pl
%   ?- run_tests.
%
% Note that after running swipl hw10b.pl from the command line, your
% source file is loaded into the interpreter and you can do basic
% tests there for debugging.
%


% Question 1: my_min


% Question 2: my_median


% Question 3: my_triangle_area


% Question 4: my_circle_area


% Question 5: my_midpoint


% Question 6: my_manhattan_distance


% Question 7: my_euclidean_distance


% Question 8: my_range_sum


% Question 9: my_gdc


% Question 10: my_even and my_odd



%----------------------------------------------------------------------
% UNIT TESTS
%----------------------------------------------------------------------

:- begin_tests(all_tests).

% Question 1 Tests
test(my_min_1) :- my_min(1,2,1), !.
test(my_min_2) :- my_min(2,1,1), !.
test(my_min_3) :- my_min(1,1,1), !.

% Question 2 Tests


% Question 3 Tests


% Question 4 Tests


% Question 5 Tests


% Question 6 Tests


% Question 7 Tests


% Question 8 Tests


% Question 9 Tests


% Question 10 Tests


:- end_tests(all_tests).


