clc; clear all; close all

%% hw 4 problem 4 finding transformation

syms t1 t2 t3 t4 sig w 

T_matrix = [t1 t2;t3 t4];

T_matrix_inv = inv(T_matrix);

A_matrix = [0 1;-(sig^2+w^2) 2*sig];

A_bar = [sig w; -w sig];

%% equation for finding transformation matrix is A_bar = inv(T)*A*T

RHS = T_matrix_inv*A_matrix*T_matrix;

eqn_1 = sig == RHS(1,1);
eqn_2 = w == RHS(1,2);
eqn_3 = -w == RHS(2,1);
eqn_4 = sig == RHS(2,2);

eqns = [eqn_1 eqn_2 eqn_3 eqn_4];

sol = solve(eqns,[t1 t2 t3 t4]);

%% solution gives our transformation matrix 

% we have two solutions for T

i = 2; % change this to choose which solution you want but they both satisfy A_bar_test

switch(i)
    case 1
    transformation_matrix = [sol.t1(1) sol.t2(1); sol.t3(1) sol.t4(1)]
    case 2 
    transformation_matrix = [sol.t1(2) sol.t2(2); sol.t3(2) sol.t4(2)]
end

%% test 

A_bar_test = simplify(inv(transformation_matrix)*A_matrix*transformation_matrix)