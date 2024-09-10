clc; clear; close all;

%% HW 1 problem 2 section d 

% this matlab file plots the response of a 1D mass spring system for three
% different spring configuration, hardening, softening, and linear spring.
% And each spring model will have 4 different initial condition

%% setting initial condition and parameters


Tspan = 0:0.01:10;

IC1 = [0.2 0.2]';
IC2 = [0.5 0.5]';
IC3 = [0.8 -0.1]';
IC4 = [-0.3 -0.6]';

options = odeset('RelTol',1e-6,'AbsTol',1e-9);

%% calling ode45 to solve nonlinear equation with IC1
tic
[T Y] = ode45(@(t,x) hard_model(t,x),Tspan,IC1,options);
[T Y1] = ode45(@(t,x) soft_model(t,x),Tspan,IC1,options);
[T Y2] = ode45(@(t,x) linear_model(t,x),Tspan,IC1,options);
% plot all model response for IC number i
figure(1)
plot(Y(:,1),Y(:,2),'LineWidth',2);
hold on 
grid on 
plot(Y1(:,1),Y1(:,2),'LineWidth',2);
plot(Y2(:,1),Y2(:,2),'LineWidth',2);
legend('hard_model','sof_spring','linear_model')
xlabel('y(t)');
ylabel('y_dot(t)');
axis equal
toc
%% calling ode45 to solve nonlinear equation with IC2
tic
[T Y] = ode45(@(t,x) hard_model(t,x),Tspan,IC2,options);
[T Y1] = ode45(@(t,x) soft_model(t,x),Tspan,IC2,options);
[T Y2] = ode45(@(t,x) linear_model(t,x),Tspan,IC2,options);
% plot all model response for IC number i
figure(2)
plot(Y(:,1),Y(:,2),'LineWidth',2);
hold on 
grid on 
plot(Y1(:,1),Y1(:,2),'LineWidth',2);
plot(Y2(:,1),Y2(:,2),'LineWidth',2);
legend('hard_model','sof_spring','linear_model')
xlabel('y(t)');
ylabel('y_dot(t)');
axis equal
toc
%% calling ode45 to solve nonlinear equation with IC3
tic
[T Y] = ode45(@(t,x) hard_model(t,x),Tspan,IC3,options);
[T Y1] = ode45(@(t,x) soft_model(t,x),Tspan,IC3,options);
[T Y2] = ode45(@(t,x) linear_model(t,x),Tspan,IC3,options);
% plot all model response for IC number i
figure(3)
plot(Y(:,1),Y(:,2),'LineWidth',2);
hold on 
grid on
plot(Y1(:,1),Y1(:,2),'LineWidth',2);
plot(Y2(:,1),Y2(:,2),'LineWidth',2);
legend('hard_model','sof_spring','linear_model')
xlabel('y(t)');
ylabel('y_dot(t)');
axis equal
toc
%% calling ode45 to solve nonlinear equation with IC4
tic
[T Y] = ode45(@(t,x) hard_model(t,x),Tspan,IC4,options);
[T Y1] = ode45(@(t,x) soft_model(t,x),Tspan,IC4,options);
[T Y2] = ode45(@(t,x) linear_model(t,x),Tspan,IC4,options);
% plot all model response for IC number i
figure(4)
plot(Y(:,1),Y(:,2),'LineWidth',2);
hold on 
grid on
plot(Y1(:,1),Y1(:,2),'LineWidth',2);
plot(Y2(:,1),Y2(:,2),'LineWidth',2);
legend('hard_model','sof_spring','linear_model')
xlabel('y(t)');
ylabel('y_dot(t)');
axis equal
toc
%% for fun, wanna see system response for IC4
figure(5)
hold on
plot(Tspan',Y(:,2),"LineWidth",2);
plot(Tspan',Y1(:,2),"LineWidth",2);
plot(Tspan',Y2(:,2),"LineWidth",2);
legend('hard_model','sof_spring','linear_model')
%% function definition
function y = hard_model(t,x)



y = zeros(2,1);

y(1) = x(2);
y(2) = -(1)*(1+x(1)^2)*x(1);

end

function y = soft_model(t,x)


y = zeros(2,1);

y(1) = x(2);
y(2) = -(1)*(1-x(1)^2)*x(1);

end

function y = linear_model(t,x)



y = zeros(2,1);

y(1) = x(2);
y(2) = -(1)*x(1);

end

