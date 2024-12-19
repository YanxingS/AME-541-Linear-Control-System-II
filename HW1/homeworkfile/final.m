clc; clear all; close all;

%% problem 1 inverted pendulum

syms m g M l 

A_matrix = [0 0 1 0; 0 0 0 1; 0 -(m*g)/M 0 0; 0 ((M+m)/(2*M*l))*g 0 0];

B_matrix = [0; 0; 1/M; -1/(2*M*l)];

A = double(subs(A_matrix,[M m g l],[1 1 9.8 0.5]));

B = double(subs(B_matrix,[M m l],[1 1 0.5]));

C_4 = [B A*B A^2*B A^3*B]; % controlability matrix

%% check observability

C_cart_pos = [1 0 0 0];
C_pen_ang =  [0 1 0 0];

O_4_cart_pos = double([C_cart_pos;C_cart_pos*A;C_cart_pos*A^2;C_cart_pos*A^3]);

rank(O_4_cart_pos);

O_4_pen_ang = double([C_pen_ang;C_pen_ang*A;C_pen_ang*A^2;C_pen_ang*A^3]);

rank(O_4_pen_ang);

%% problem 2 find k matrix and two different L for observer design

K = lqr(A,B,eye(4),1);

% design of L using only cart position sensor with LQR 

L_cart_pos = lqr(transpose(A),transpose(C_cart_pos),eye(4),1);

L_cart_pos = transpose(L_cart_pos);

% design of L using both cart position and pendulum angle sensor

C_cart_and_pen = [1 0 0 0; 0 1 0 0];

L_cart_and_pen = lqr(transpose(A),transpose(C_cart_and_pen),eye(4),eye(2));

L_cart_and_pen = transpose(L_cart_and_pen);

%% problem 3 check problem 2 with only cart position as output

sys = ss(A,B,C_cart_pos,0); % only with cart pos 

% system tf

[tf_num tf_den] = ss2tf(A,B,C_cart_pos,0);

tf_dy_sys = tf(tf_num,tf_den);

% observer tf

[obsv_tf_num obsv_tf_den] = ss2tf(A-L_cart_pos*C_cart_pos-B*K,L_cart_pos,-K,0);

tf_obser_sys = tf(obsv_tf_num,obsv_tf_den);

% connect two system 

full_sys = feedback(tf_dy_sys,-tf_obser_sys)

full_sys_num = [0 0 1 20.7884 185.1779 -1.6715e+03 -7.8755e+03 1.4384e+04 5.8454e+04];
full_sys_den = [1 20.7884 175.3779 771.8481 1.9099e+03 2.7210e+03 2.2638e+03 1.0381e+03 214.7520];
%% problem 4 generate reponse of the system with three different controller

% observer state feedback with k designed with LQR

t = 0:0.01:15

IC = [0 deg2rad(10) 0 0];

first_sys = ss(A-B*K,B,C_cart_and_pen,0);

output_a = initial(first_sys,IC,t);

second_sys_A = [A-B*K B*K;zeros(4) A-L_cart_and_pen*C_cart_and_pen];

IC = [0 deg2rad(10) 0 0 0 0 0 0];

second_sys = ss(second_sys_A,zeros(8),eye(8),0);

output_b = initial(second_sys,IC,t);

third_sys_A = [A-B*K B*K;zeros(4) A-L_cart_pos*C_cart_pos];

third_sys = ss(third_sys_A,zeros(8),eye(8),0);

output_c = initial(third_sys,IC,t);

% plotting section

figure(1)
hold on

plot(t,output_a(:,1))

plot(t,output_b(:,1))

plot(t,output_c(:,1))

title('cart position')
ylabel('magnitude')
xlabel('time')

legend('state feedback','observer with both sensor','observer with only cart pos')


hold off 

figure(2)

hold on

plot(t,output_a(:,2))

plot(t,output_b(:,2))

plot(t,output_c(:,2))

title('pendulum angle')
ylabel('magnitude')
xlabel('time')

legend('state feedback','observer with both sensor','observer with only cart pos')

%% problem 5

syms a r

A_p5 = [1 0; 2 a];
B_p5 = [1;1];

% C_2 = [B,A_p5*B_p5];

% section c

A_cl = 1-(2+sqrt(4+4*inv(r)))/2;

fplot(A_cl,[0 200],LineWidth=2)

title('pole location as a function of r')
xlabel('r value')
ylabel('pole location')

%% problem 6

s = tf('s');

G = 1/(s*(s+1));

sys = ss(G);

A_p6 = sys.A;
B_p6 = sys.B;
C_p6 = sys.C;
D_p6 = sys.D;

K_p6 = place(A_p6,B_p6,[-2+2*i -2-2*i]);

L_p6 = [181 19]';

obs_sys = A_p6-L*C_p6;

A_cl_p6 = A_p6-B_p6*K_p6;


full_sys_p6_A = A_p6-B_p6*K_p6-L_p6*C_p6; % observer based feedback system
full_sys_p6_B  = L;
full_sys_p6_C = -K;