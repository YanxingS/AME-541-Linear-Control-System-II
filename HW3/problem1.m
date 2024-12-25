clc; clear all; close all;

%% find the resolvent given a matrix 

syms s

A1 = [1 1 0; 0 1 0; 0 0 1];
A2 = [1 1 0; 0 0 1; 0 0 1];
A3 = [2 0 0 0; 2 2 0 0; 0 0 3 3; 0 0 0 3];

Resolvent_A1 = (s*eye(3)-A1)^-1
inv_Resolvent_A1 = ilaplace(Resolvent_A1)

Resolvent_A2 = (s*eye(3)-A2)^-1
inv_Resolvent_A2 = ilaplace(Resolvent_A2)

Resolvent_A3 = (s*eye(4)-A3)^-1
inv_Resolvent_A3 = ilaplace(Resolvent_A3)