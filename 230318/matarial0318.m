clc, clear all

%재료역학 강의 메모 및 계산
% 
tan = tan(0:0.05:(1));
plot(tan)
hold on
N = 3; 
k = 3
sin = k*sin(0:0.01:(N*2*pi))';
%plot(sin)
hold on 
cos = k* cos(0:0.01:(N*2*pi))';
%plot(cos)
hold on
grid

%기본적으로 각도 단위 rad에서 적용 됨

% P = 30;
% Q = 20;
% th = 1/3*pi;
% R = sqrt(P^2+Q^2 + (2*P*Q*sin(th)))
% 
% rx = 70 * sin(1/6*pi)-40*cosd(60)