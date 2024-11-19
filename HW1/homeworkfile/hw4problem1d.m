clc; clear all; close all 

%% hw 4 problem 1d

syms k t r

eqn(k,t) = (k*r*exp(-t*(k^2+1)/r)-k*r*exp(-t*(k^2+2)/r));

eqn_matrix = zeros(length(0:0.01:1),length(0:0.01:1));

i_index = 1;
j_index = 1;
for i = 0:0.01:1
    j_index = 1;
    for j = 0:0.01:1
        eqn_matrix(i_index,j_index) = double(subs(eqn,[k t r],[i j 1]));
        j_index = j_index+1;   
    end
    i_index = i_index+1;
end


%%

eqn_matrix_2 = zeros(length(5:0.02:6),length(5:0.02:6));

i_index = 1;
j_index = 1;
for i = 5:0.02:6
    j_index = 1;
    for j = 5:0.02:6
        eqn_matrix_2(i_index,j_index) = double(subs(eqn,[k t r],[i j 1]));
        j_index = j_index+1;   
    end
    i_index = i_index+1;

end
%%
surf(eqn_matrix);
xlabel("t index value");
ylabel("k index value");
zlabel("magnitude");
figure(2);
surf(eqn_matrix_2);
xlabel("t index value");
ylabel("k index value");
zlabel("magnitude");