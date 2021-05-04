
%----------------------------------------------------------------------
% Name: Charles Walker
% File: hw10b.pl
% Date: 5/3 Spring 2021
% Desc: Rules practice with prolog
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
my_min(X,Y,X) :- X =< Y.
my_min(X,Y,Y) :- Y < X.

% Question 2: my_median
my_median(X,Y,Z,M):- Z > X, my_min(X,Y,R), neg_return(X,Y,R,M1), my_min(M1,Z,M).
my_median(X,Y,Z,M):- Z < X, my_min(Z,Y,R), neg_return(Z,Y,R,M1), my_min(M1,X,M).
neg_return(X,Y,_,X):- X == Y.
neg_return(X,_,N,X):- X \== N.
neg_return(_,Y,N,Y):- Y \== N.


% Question 3: my_triangle_area
my_triangle_area(B,H,A) :- A is (B*H) /2.

% Question 4: my_circle_area
my_circle_area(R,A) :- A is (3.14*R*R).

% Question 5: my_midpoint
my_midpoint((X1,Y1), (X2,Y2), (X3,Y3)) :- X3 is (X1 + X2) /2, Y3 is (Y1 + Y2) /2.

% Question 6: my_manhattan_distance
my_manhattan_distance((X1,Y1), (X2,Y2), D) :- abs(X1-X2, X), abs(Y1-Y2, Y), D is X+Y.
abs(X,X) :- X > 0.
abs(X,R) :- X < 0, R = 0-X.

% Question 7: my_euclidean_distance
my_euclidean_distance((X1,Y1), (X2,Y2), D) :- abs(X1-X2, X), abs(Y1-Y2, Y), D is ((X*X)+(Y*Y))^(1/2).

% Question 8: my_range_sum
my_range_sum(V1,V2,Sum) :- V1 > V2, Sum = 0.
my_range_sum(V1,V2,Sum) :- V1 == V2, Sum = V2.
my_range_sum(V1,V2,Sum) :- Start is V1+1, my_range_sum(Start, V2, Sum2), Sum is Sum2 + V1.


% Question 9: my_gdc
my_gcd(X,Y,D) :- X == 0, D = Y.
my_gcd(X,Y,D) :- Y == 0, D = X.
my_gcd(X,Y,D) :- X > Y, X2 is X mod Y, my_gcd(X2,Y,D2), D is D2.
my_gcd(Y,X,D) :- X > Y, X2 is X mod Y, my_gcd(X2,Y,D2), D is D2.


% Question 10: my_even and my_odd
my_even(X) :- X == 0.
my_even(X) :- X > 0, X2 is X-2 , \+ my_odd(X2).
my_odd(X) :- X == 1.
my_odd(X) :- X > 0, X2 is X-2, my_odd(X2).


%----------------------------------------------------------------------
% UNIT TESTS
%----------------------------------------------------------------------

:- begin_tests(all_tests).

% Question 1 Tests: my_min
test(my_min_1) :- my_min(1,2,1), !.
test(my_min_2) :- my_min(2,1,1), !.
test(my_min_3) :- my_min(1,1,1), !.

% Question 2 Tests: my_median
test(my_median_2) :- my_median(5,8,4,5), !.
test(my_median_3) :- my_median(1,2,3,2), !.
test(my_median_4) :- my_median(3,1,2,2), !.

% Question 3 Tests: my_triangle_area(
test(my_triangle_area_1) :- my_triangle_area(3,2,3), !.

% Question 4 Tests: my_circle_area
test(my_circle_area_1) :- my_circle_area(4,50.24), !.
test(my_circle_area_2) :- my_circle_area(1,3.14), !.

% Question 5 Tests: my_midpoint
test(my_midpoint_1) :- my_midpoint((1,1), (3,5), (2,3)), !.

% Question 6 Tests: my_manhattan_distance
test(my_manhattan_1) :- my_manhattan_distance((1,1), (3,4), 5), !.
test(my_manhattan_2) :- my_manhattan_distance((3,1), (1,4), 5), !.

% Question 7 Tests:my_euclidean_distance
test(my_euclidean_distance_1) :- my_euclidean_distance((1,1), (4,5), 5.0), !.

% Question 8 Tests: my_range_sum
test(my_range_sum_1) :- my_range_sum(2,2,2), !.
test(my_range_sum_2) :- my_range_sum(2,4,9), !.
test(my_range_sum_3) :- my_range_sum(2,1,0), !.

% Question 9 Tests: my_gdc
test(my_gcd_1) :- my_gcd(10,15,5), !.
test(my_gcd_2) :- my_gcd(10,5,5), !.
test(my_gcd_3) :- my_gcd(3,5,1), !.

% Question 10 Tests: my_even and my_odd
test(my_even_1) :- my_even(10), !.
test(my_even_2) :- my_even(0), !.
test(my_odd_1) :- my_odd(5), !.
test(my_odd_2) :- my_odd(11), !.
:- end_tests(all_tests).


