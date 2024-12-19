clc; clear all; close all;

%% hw 5 problem 3 part b

syms p1 p0 p2 

eqn1 = 2*p1 + 4*p0 == -2;
eqn2 = -2*p0 +2*p2 - p1 == 0;
eqn3 = -2*p0 -6*p2 == -2;

eqns = [eqn1 eqn2 eqn3];

sol = solve(eqns,[p1 p0 p2]);

P = [sol.p1 sol.p0; sol.p0 sol.p2];