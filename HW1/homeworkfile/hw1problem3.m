clc; clear; close all;

%% hw 1 problem 3c
% this file plots the system response of a 1D nonlinear scalar differential
% equation and compares them to the linearized model at three different
% equalibrium point

tspan = 0:0.001:1;
options = odeset('RelTol',1e-6,'AbsTol',1e-9);

%% call ode45 to solve for diff_eqn for first equalibrium point IC

% compare to linearized model

IC = 1e-5;

[T Y] = ode45(@(t,x) diff_eqn(t,x),tspan,IC,options);

% compare linearized model

Y_lin = IC*exp(-tspan);
plot(tspan',Y(:,1),tspan',Y_lin);

grid on

function dx = diff_eqn(t,x)

dx = x*(x^2-1);

end