clc; clear all ; close all;

%% hw 3 problem 3 section 2 find all equilibrium points

syms x1 x2 

eqn1 = -x1^2 + x1*x2;

eqn2 = -2*x2^2 + x2 - x1*x2 + 2 ;

[sol1, sol2] = solve ([eqn1 eqn2],[x1,x2])
