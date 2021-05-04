
%----------------------------------------------------------------------
% Name: Charles Walker
% File: hw10a.pl
% Date: 5/3 Spring 2021
% Desc: Query practice in prolog
%----------------------------------------------------------------------

% Question 1: Query to find movies released in 2006
% ?- movie(M,2006).

% Question 2: Write a query to find movies that were released in the 1980’s
% ?- movie(M,Y), Y > 1979,  Y <1990.  


% Question 3: Write a query to find directors of movies released in 1998.
% ?- director(M,D), movie(M,1998).

% Question 4: Write a query to find actors in a movie that they also directed
% ?- actor(M,A,_), director(M,A).

% Question 5: Write a query to find movies in which Frances McDormand and Holly Hunter were co-stars.
% ?- actress(M,frances_mcdormand,_), actress(M,holly_hunter,_).
% M = raising_arizona.

:- consult('movies.pl').

% Question 6: Write rules for a relation star(M,A) such that A is either an actor or actress in movie M
start(M,A) :- actor(M,A,_).
start(M,A) :- actress(M,A,_).


% Question 7: Write a rule for a relation co_star(A1,A2) such that A1 and A2 were two different stars in the
% same movie.
co_star(A1,A2) :- A1 \== A2, actress(M,A1,_), actress(M,A2,_).
co_star(A1,A2) :- A1 \== A2, actor(M,A1,_), actor(M,A2,_).
co_star(A1,A2) :- A1 \== A2, actress(M,A1,_), actor(M,A2,_).

% Question 8: Write a rule for a relation starred_2(A,Y) to find actresses and actors that starred in 2
% different movies in the same year
starred_2(A,Y) :- actor(M,A,_), actor(M1,A,_), M \== M1, movie(M,Y), movie(M1,Y).



