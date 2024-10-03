clc; clear all; close all

%% problem 6c finding eigenvector of a and b 

syms t
result = [];
a_span = linspace(0,10,10);
T_span = linspace(0,10,100);

for i = 1:10

a = a_span(i);
A = [-1 -2 0 ; -2 -5 0 ; a 2*a -1];
[V_right D]= eig(A);
%% V D above is the right eigenvector, now compute left eigenvector using this relation

V_left = inv(V_right);

%% proof bi-orthogonality 

proof = rref(V_left*V_right);

%% compute the expression of output

y(t) = [0 0 1]*V_right*expm(D*t)*V_left*[1;1;1];


    for j = 1:length(T_span)
        result(j,i) = y(T_span(j));
    end
    plot(T_span,result(:,i));
    hold on;
    
end
xlabel('time in seconds')
ylabel('y(t)')
title('system response vs time')
legend('alpha = 1','alpha = 2','alpha = 3', ...
    'alpha = 4','alpha = 5','alpha = 6', ...
    'alpha = 7','alpha = 8','alpha = 9', ...
    'alpha = 10');
