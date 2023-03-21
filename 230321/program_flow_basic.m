clear, clc, close all

% v = exp(1);
%
% if 2^v > v^2
%     disp('left is bigger')
% else
%     disp('right is bigger')
% end
%
%
% x = 3
% x = NaN
% if isnan(x) %nan은 부정치를 의미
%     disp('Not a Number')
% elseif isinf(x)
%     disp('infinity')
% else
%     disp('A floating point number')
% end
%

% for문 기초

% for x = [pi/6 pi/4 pi/3]
%     disp([x sin(x)])
% end
%
% % 꿀팁 : for문 누르면 end 미리 입력
%
% for i = 1:10
%     if i<5
%         continue
%     end
%     %disp(i)  % 하나씩 보여주는 방식
%     x(i) = i; % 하나씩 행렬에 저장 후 for문 종료 후 한번에 출력
%
% end
%
% disp(x)


% while문을 통해 matlab에서 가장 작은 수 표현

% 다시 팁: ctrl + i로 정렬, while도 end 미리 넣어주
while(1) % true는 1
    xmin = x;
    x = x/2;


end
