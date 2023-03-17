% fser.m: 불규칙 Fibonacci 수열
% x(n+1) = x(n) + or - x(n-1)

rand('state', 100)

m = 1000;
x = [1 2];

for n=2:m-1

    x(n+1) = x(n)+ sign(rand-0.5)*x(n-1); %rand는 랜덤/sign은 인수의 양/음 판
end

% ctri + i 누르면 정리가 된다

semilogy(1:m, abs(x))

hold on
c= 1.13198824;
semilogy(1:1000, c.^[1:m])
hold off