clc; clear all; close all

%% hw 4 problem 1 

syms k r lamda s t 

A(k,r,lamda) = [-(1+k^2)/r k; 0 -(2+k^2)/r];

[V,R] = eig(A);

%% find the STM of the system 

STM = ilaplace(inv(s*eye(2)-A))

%% plotting x1(t)
clear r k

r = 1;
r2 = 100;
k = 1;
x1_0 = 1;
x2_0 = 1;

x1_t_1 = x1_0*(exp(-t*(k^2+1)/r))+x2_0*(k*r)*exp(-t*(k^2+1)/r)-(k*r)*(exp(-t*(k^2+2)/r));
x1_t_2 = x1_0*(exp(-t*(k^2+1)/r2))+x2_0*(k*r2)*exp(-t*(k^2+1)/r2)-(k*r2)*(exp(-t*(k^2+2)/r2));
fplot(x1_t_1,[1 5],'LineWidth',2);
xlabel("time");
ylabel("x1 response")
title("x1 response for r = 1 and k = 1");
figure(2)
fplot(x1_t_2,[1 400],'LineWidth',2);
xlabel("time");
ylabel("x1 response")
title("x1 response for r = 100 and k = 1");
