a = 2.8;
xinit = 0.1;
n = 30;

[ts, xp] = pmod(a, xinit, n)

plot(ts,xp)

xlabel('time step')
ylabel('population')
title('Population growth model')