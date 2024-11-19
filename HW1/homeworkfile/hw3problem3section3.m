clc; clear all; close all;

%% hw 3 problem3 section 3 find resolvent of linearized system

% linearized A matrix

syms s

A = [-1 1;-1 -4];

resolvent = (s*eye(2)-A)^-1;

resolvent = simplify(resolvent)

STM = ilaplace(resolvent)

simplify(STM)

%% part d stability analysis

[V D] = eig(A)