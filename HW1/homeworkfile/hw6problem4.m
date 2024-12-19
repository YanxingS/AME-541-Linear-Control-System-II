clc;
clear all;
close all

%% problem 4 section 1 

syms l1 l2 g1 g2 g3 b1 b2 b3

A1 = [l1 1 0; 0 l1 1; 0 0 l1];
A2 = [l2 1 0; 0 l2 1; 0 0 l2];

B1 = [g1;g2;g3];
B2 = [b1;b2;b3];

R_3 = [A1^2*B1 A*B1 B1]

subs(R_3,[g1 g2 g3],[0 0 1])

newA = [A1 zeros(3);zeros(3) A2];
newB = [B1;B2]

R_6 = [newA^2*newB newA*newB newB]

subs(R_6,[g1 g2 g3 b1 b2 b3],[0 0 1 0 0 1])