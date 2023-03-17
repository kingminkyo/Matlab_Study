function y = minkyo(x)

% minkyo는 x=10^(-b) 에 대하여 sin(x)/x 를 계산한다
% 여기서 b = 1, ... , c이다.

format long 
b = 1:x ;
x = 10.^(-b);
y = (sin(x)./x)';

% ax = b 
% x = b*a^(-1)