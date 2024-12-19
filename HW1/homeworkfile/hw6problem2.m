clc; clear all; close all

%% problem 2 

% first plot my own hand computed H infinity norm of the SISO system

numerator = 1;
denominator = [1 10^-6 1];

sys_tf = tf(numerator,denominator);


omega_list = linspace(10e-1,10e1,3);
H_magnitude = zeros(size(omega_list));

for i = 1:length(omega_list)
    H_magnitude(i) = abs(freqresp(sys_tf,omega_list(i)));
end

plot(omega_list,H_magnitude,LineWidth=2);
title("Frequency Response");
xlabel("frequency");
ylabel("magnitude");
grid on
H_inf = max(H_magnitude);

disp(["H_inf norm is :", num2str(H_inf)]);
disp(["happened at :", num2str(omega_list(H_magnitude == H_inf))]);