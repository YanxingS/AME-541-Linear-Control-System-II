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

figure(1)
hold on
plot(tspan',Y(:,1),'LineWidth',2);
plot(tspan',Y_lin(1,:),'LineWidth',2);
legend('nonlinear response','linear response');
xlabel('time')
ylabel('output magnitude')
grid on

%% call ode45 to solve for diff_eqn for second equalibrium point IC1

IC2 = -0.99;
[T Y1] = ode45(@(t,x) diff_eqn(t,x),tspan,IC2,options);

% compare linearized model

Y_lin = (0.01)*exp(2*tspan)-1;

figure(2)
hold on
plot(tspan',Y1(:,1),'LineWidth',2);
plot(tspan',Y_lin(1,:),'LineWidth',2);
legend('nonlinear response','linear response');
xlabel('time')
ylabel('output magnitude')
grid on

%% call ode45 to solve for diff_eqn for second equalibrium point IC1

IC3 = 0.99;
[T Y2] = ode45(@(t,x) diff_eqn(t,x),tspan,IC3,options);

% compare linearized model

Y_lin = (-0.01)*exp(2*tspan)+1;

figure(3)
hold on
plot(tspan',Y2(:,1),'LineWidth',2);
plot(tspan',Y_lin(1,:),'LineWidth',2);
legend('nonlinear response','linear response');
xlabel('time')
ylabel('output magnitude')
grid on

%% function definition
function dx = diff_eqn(t,x)
dx = x*(x^2-1);
end
