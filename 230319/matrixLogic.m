% 행렬의 논리 연산 가능

% 기초 복습

A = [1 2; 3 4]
B = 2* ones(2) % 단위 행렬

A == B % 같은 부분만 추출 (B가 단위행렬이므로 2*2 정방행렬로 동작)

% 응용 

b = magic(10)
c = b(1,:) % b에서 1행만 추출 
result = c((c>50)) % c에서 특정 조건 원소들만 추출

% 특수

Q = [1 inf ; inf NaN] % inf: NaN: 정의될 수 없는 숫자

isinf(Q)

com = complex(1,0) % complex double 타입 형태로 저장 됨

x = [-1 1 1];
y = [1 2 -2];

xor(x>0, y>0)

any(x>0) % 어떤 하나라도 조건에 맞는게 있는지 판단
all(x>0) % 모든 조건이 맞아야 True

findTest = [-3 1 0 -inf 0]
f = find(findTest); % 0이 아닌 열의 값만 추출

find(isfinite(findTest));

findTest([1 2 3 5])







