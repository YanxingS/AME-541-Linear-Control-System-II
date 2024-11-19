clc; clear all; close all;

%% hw 4 problem 1d

syms k t r

eqn =(k*r*exp(-t*(k^2+1)/r)-k*r*exp(-t*(k^2+2)/r));

diff_wrt_t = diff(eqn,t) == 0;
diff_wrt_k = diff(eqn,k) == 0;


sol = solve([diff1 diff2],[t k])

