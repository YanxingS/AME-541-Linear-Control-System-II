clc; clear; close all

%% this program solves inverse Z-transform

% A matrix

A = [0 1;-0.5 0.3];

syms z n

det = z^2-0.3*z+0.5;

phi_z = [(z^2-0.3*z)/(det) z/(det);(-0.5*z)/(det) z^2/(det)];

phi_9(n) =  iztrans(phi_z);

double(phi_9(9))

A^9