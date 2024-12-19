clc; clear all; close all;

%% hw 6 AME 541 problem 1

% determine k and r for which the system is stable

syms k r t x1 x2 x3 x4 s x1_0 x2_0

A = [-(1+k^2)/r 0 ; k -(2+k^2)/r];

A_transpose = transpose(A);

[V,D] = eig(A); 

B = [1;0];

C =[0 1];

D = 0;

%% compute H2 norm of system using ALE 

RHS = -B*transpose(B);

x_matrix = [x1 x2; x3 x4]

eqn_matrix = A*x_matrix+x_matrix*A_transpose == -B*transpose(B)

eqn1 = eqn_matrix(1,1);
eqn2 = eqn_matrix(1,2);
eqn3 = eqn_matrix(2,1);
eqn4 = eqn_matrix(2,2);

eqns = [eqn1 eqn2 eqn3 eqn4];

sol = solve(eqns,[x1 x2 x3 x4]);

sol_matrix = [sol.x1, sol.x2;sol.x3 sol.x4]

norm_eqn(k,r) = trace(C*sol_matrix*transpose(C))

%% plotting H2 norm as a function of k with r = 1 and r = 1000


fplot(norm_eqn(k,1))
title("H2 norm as function of k ")
legend('r = 1')
ylabel('magnitude')
xlabel('k value')
figure(2);
fplot(norm_eqn(k,1000))
title("H2 norm as function of k ")
legend('r = 1000')
ylabel('magnitude')
xlabel('k value')

%% plotting H2 norm as a function of r with k = 2

figure(3)
fplot(norm_eqn(2,r))
title("H2 norm as function of r ")
legend('k = 2')
ylabel('magnitude')
xlabel('r value')

%% section c find the unforced response of the system

% find resolvent

sys_resolvent = inv(s*eye(2)-A);

G = C*sys_resolvent;

G1(t,k,r) = ilaplace(G(1));
G2(t,k,r) = ilaplace(G(2));

%% finding maximum singular value in t from 0 to 1000 for r = 1000 k = 0 

% this case G(1) is zero

figure(4)
fplot(G1(t,0,1000),[0 1000])
hold on
fplot(G2(t,0,1000),[0 1000])
title('G(t) over time for k = 0, r = 1000')
legend('G1','G2')
xlabel('time')
ylabel('magnitude')

%% finding maximum singular value in t from 0 to 1000 for r = 1000 k = 2 

figure(5)
fplot(G1(t,2,1000),[0 1000])
hold on
fplot(G2(t,2,1000),[0 1000])
title('G(t) over time for k = 2, r = 1000')
legend('G1','G2')
xlabel('time')
ylabel('magnitude')
