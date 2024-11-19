clc; clear all; close all;

%% hw 3 problem 1 using Jordan blocks to solve

A2 = [1 1 0; 0 0 1; 0 0 1];
[P_inv,J] = jordan(A2);

syms t

STM_A2 = P_inv*[1 0 0; 0 exp(t) t; 0 0 exp(t)]*inv(P_inv)