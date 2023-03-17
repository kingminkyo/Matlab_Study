clear, clc, close all
x = 3;
y =2;
temp =0;

% if 기본 연습

if x>y
    temp =y;
    y=x;
    x = temp
end

s(1) = 0;

% for문 기본 연습

for i=1:25
    s(i+1)=s(i)+1/i;
end

% 직관성을 위해 전치행렬 변환

s = s'

% 피보나치 구현

f(1) =1;
f(2) =1;

n=10; % 구할 영역

for i=3:n
    f(i)=f(i-1)+f(i-2);
end

f=f';

f(n) % ans ! 
