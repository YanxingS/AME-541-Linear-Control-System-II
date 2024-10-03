clc; clear all; close all

%% this program finds the STM matrix for Mathieu equation
% 
% % the solved y(t) function 
% 
% t_span = 0:0.01:1.309*pi;
% 
% y = exp(sqrt(-2+cos(2.*t_span)).*t_span);
% 
% real_y = real(y);
% imag_y = imag(y);
% 
% plot(real_y,imag_y)

%% solving Mathieus-Equation and STM

t_span = 180;
[t phi] = ode45(@(t,phi) Matheius_SS(t,phi),[0 t_span],[1 0 0 1]);

[t y] = ode45(@(t,y) Matheius_eq(t,y),[0 t_span],[0 3]);

figure(2);
hold on;
plot(t,y(:,1));
grid on 
title('y response vs time in seconds')
xlabel('time in seconds');
ylabel('y(t)');
% plot(t,y(:,2));

%% print last STM

STM = vertcat(phi(end,1:2),phi(end,3:4))
%% define Mathieus-Equation and its STM 

function dphi_dt = Matheius_SS(t,phi)
    dphi_dt = zeros(4,1);
    
    dphi_dt(1) = phi(3);
    dphi_dt(2) = phi(4);
    dphi_dt(3) = phi(1)*(-2+cos(2*t));
    dphi_dt(4) = phi(2)*(-2+cos(2*t));
end

function dydt = Matheius_eq(t,y)
    dydt = zeros(2,1);

    dydt(1) = y(2);
    dydt(2) = y(1)*(-2+cos(2*t));
end

