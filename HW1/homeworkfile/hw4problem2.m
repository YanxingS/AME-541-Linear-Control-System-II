clc; clear all; close all;

%% hw 4 problem 2 solve algebraic Lypunav equation

syms p0 p1 p2 k r 

eqn1 = -1 == -p1*((1+k^2)/r) - (p1*(1+k^2)/r);
eqn2 = 0 == -p0*((1+k^2)/r) + p1*k - p0*((2+k^2)/r);
eqn3 = -1 == p0*k-p2*((2+k^2)/r) + p0*k-p2*((2+k^2)/r);

eqns = [eqn1, eqn2, eqn3,];

sol = solve(eqns,[p0 p1 p2]);

p0_sol(k,r) = sol.p0;
p1_sol(k,r) = sol.p1;
p2_sol(k,r) = sol.p2;


%% stability property analysis using 

P_matrix = [p1_sol p0_sol; p0_sol p2_sol];
[V,D] = eig(P_matrix);


D1_string = string(D);
displayFormula(D1_string);