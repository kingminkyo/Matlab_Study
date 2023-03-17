clear, clc, close all

A = rand(100,100);
B = rand(100,1);


tic
x = inv(A)*B; % 연산 과정을 두 번 거치므로 Data 값이 많을 때 많은 시간 소모
toc

tic
x = A\B; % 위 계산 대비 적은 시간 소모
toc
