clc; clear all; close all;

syms lam1 lam2 lam3 gam1 gam2 gam3 

A_matrix(lam1,lam2,lam3) = [lam1 0 0;0 lam2 0; 0 0 lam3];
B_matrix(gam1,gam2,gam3) = [gam1;gam2;gam3];

R_3 = [A_matrix(lam1,lam2,lam3)^2*B_matrix(gam1,gam2,gam3) A_matrix(lam1,lam2,lam3)*B_matrix(gam1,gam2,gam3) B_matrix(gam1,gam2,gam3)]

A = A_matrix(1,2,3);
B = B_matrix(1,1,1);



optimal_u = [];
Rn = [0;0;0];
xd = [1 2 3]';

for k = 1:10
    Rk = [Rn mpower(A,k)*B];
    Pk = Rk*transpose(Rk);
    optimal_u(k) = xd'*inv(Pk)*xd;
    Rn = Pk;
end

plot(1:10,optimal_u,LineWidth=2);
grid on
title("minimum energy require over k");
xlabel('k value')
ylabel('uk square norm')
