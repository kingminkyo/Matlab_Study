function [t,x] = pmod(a, xinit, n)
% 개체 증가 모델: x(k+1) = a*x(k)*(1-x(k))

x(1) = xinit;
t(1) = 0;

for k = 2:n+1
    t(k) =k-1;
    x(k) = a*x(k-1)*(1-x(k-1));
end
