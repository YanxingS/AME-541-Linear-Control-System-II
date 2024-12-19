clc; clear all; close all

%% problem 5 in hw 6, determine whether or not system is controllable

syms w

A = [0 1 0 0;3*w^2 0 0 2*w; 0 0 0 1; 0 -2*w 0 1];
B = [0 0; 1 0; 0 0; 0 1];
C = [1 0 0 0;0 1 0 0];
C_4 = [B A*B A^2*B A^3*B]

%% section c

A_matrix =  double(subs(A,w,1));

desire_pole = [-1,-2,-1+2*i,-1-2*i];

K = place(A_matrix,B,desire_pole);

A_cl = A_matrix-B*K;

system = ss(double(A_cl),B,C,0);

step(system)

%% section d 

O_4 = [C;C*A;C*A^2;C*A^3];

rank(O_4);