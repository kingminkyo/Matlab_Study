% 사용자 정의함수 (Lambda의 역할)

f1 = inline ('x.^3', 'x');
f1(3);
f1(1:5)

tic
g1 = @(x,y) x^2+y^2
g1(1,2)
toc

tic
g2 = inline('x^2+y^2', 'x',' y');
g2(1,2)
toc

%유사한 형태이나 자료 처리 시간에 큰 차이 없음

%행렬의 함수 계산 시에는 . 추가

tic
g3 = inline('x.^2+y.^2', 'x','y');
g3([1 2 ], [3 4])
toc





