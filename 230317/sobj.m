% sobj.m : 속이 빈 3차원 객체를 생성
clear, clc all

N= 10;
z = linspace(-5, 5, N)';
radius = sqrt(1+z.^2);
theta = 2*pi*linspace(0,1,N);

theta=2*pi*linspace(0,1,N);
X = radius * cos(theta)
Y = radius * sin(theta)
Z = z(:,ones(1,N));

%surf(X,Y,Z)
plot3(X,Y,Z)
grid
axis equal