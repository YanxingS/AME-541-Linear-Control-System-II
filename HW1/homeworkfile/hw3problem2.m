clc; clear all; close all

%% problem 2 section b) calculate the transfer function of the system

A = [-2 0 0; 0 1 0; 0 0 -1];
B = [1;0;-1];
C = [1 1 0];
D = [1];

syms s 

H = C*((s*eye(3)-A)^-1)*B

%% section a) find stability of the system

eig(A)
