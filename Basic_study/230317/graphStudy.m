% 기본 그래프 그리기

x = 1:100;
y = x.^2;
% plot(y) 

% 포뮬선 그래프 그리기

ezplot('x^2+x+1', [-2 2]) % (식, 데이터 범위)
title '포뮬선'
axis([-3 3 -1 5])

% axis([XMIN XMAX YMIN YMAX])

% 선형 함수

xx = [1 2 3 ]
yy = [4 5 6 ]

plot(xx, yy)

% 특수 함수

t = 0:0.005:1;
z = exp(10*t.*(t-1).*sin(12*pi*t))
plot(t,z)

%fplot 은 axis를 지정해줄 수 있다


y1 = exp(-x.^2);
y2 = cos(x);
plot(x, y1, x, y2)
axis([0 10 -1 1])


