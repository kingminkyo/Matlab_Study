Matlab for Mapping


1. Path Planning in Environments of Different Complexity
- 지정된 지도 두 위치 사이 장애물이 없는 경로를 계산하는 방법 실습

1) 예제 지도 불러오기
```    
load exampleMaps.mat
```
2) 위 예제 중 simpleMap 데이터를 불러와 해상도 미터 당 2셀로 설정
```
map = binaryOccupancyMap(simpleMap,2);
```
3) 로봇을 하나의 원으로 두고 지름 0.2m로 설정
```
robotRadius = 0.2;
```
4) 원본 지도의 사본을 만든다. 이후 여기에 inflate를 통해 로봇의 치수에 맞게 지도를 확장시킨다.
```
mapInflated = copy(map);
inflate(mapInflated,robotRadius);
```
5) mobileRobot 객체 생성 후 관련 속성을 정의한다.
```
prm = mobileRobotPRM;
```
6) 위에서 만든 지도를 객체에 할당한다.
```
prm.Map = mapInflated;
```
7) PRM 구성에 사용할 노드 수 설정(많을수록 경로 확률을 높이나 시간이 많이 듦, 연결된 두 노드 사이의 최대 허용 거리 설정
```
prm.NumNodes = 50;
prm.ConnectionDistance = 5;
```
8) 시작점과 종단점 설정
```
startLocation = [2 1];
endLocation = [12 10];
```
9) findpath함수를 사용하여 시작점과 종단점 사이의 경로를 탐색한다.
```
path = findpath(prm, startLocation, endLocation)
```
10) show함수를 통해 찾은 경로 시각화
```
show(prm)
```

2. Path Following for a Differential Drive Robot
- 차동 구동 로봇의 경로 추종

1) 로봇 목표 경로 설정
```
path = [2.00    1.00;
        1.25    1.75;
        5.25    8.25;
        7.25    8.75;
        11.75   10.75;
        12.00   10.00];
```
2) 현재 위치와 목표 위치 설정
```
robotInitialLocation = path(1,:);
robotGoal = path(end,:);
```

3) 초기 로봇 방향 설정(
```
initialOrientation = 0;
```

4) 로봇의 현재 Position 정의 (x, y, theta)
```
robotCurrentPose = [robotInitialLocation initialOrientation]';
```

5) 기구학적 로봇 모델 만들기
```
robot = differentialDriveKinematics("TrackWidth", 1, "VehicleInputs", "VehicleSpeedHeadingRate");
```

6) 로봇이 만든 경로를 추종하도록 구동하는 경로 추종 제어기 객체 생성
```
controller = controllerPurePursuit;
```
7) 경로를 제어기 웨이포인트에 설정
```
controller.Waypoints = path;
```
8) 1. 제어기의 파라미터(속도 변수) 설정 (단위는 m/s)
   2. 최대 각속도 설정(rad/s)
   3. 전방 주시 거리 설정(매끄러운 경로를 만들기 위해 목표 속도보다 커야함)

```
controller.DesiredLinearVelocity = 0.6;
controller.MaxAngularVelocity = 2;
controller.LookaheadDistance = 0.3;
```

9) 1. 목표 반경 정의(로봇의 최종 위치와 목표 위치 사이의 원하는 거리 임계값)
   2. 로봇 위치와 목표 위치 사이의 현재 거리 계산(이 거리가 목표 반경보다 작으면 로봇 정지)
``` 
goalRadius = 0.1;
distanceToGoal = norm(robotInitialLocation – robotGoal);
```

10) 위 파라미터를 이용한 로봇 움직임 코드 + 설명



``` m
% 시뮬레이션 루프 주기 10hz로 설정
sampleTime = 0.1;
vizRate = rateControl(1/sampleTime);


figure

% 그래프에 나타낼 수 있도록 적절한 로봇의 크기 변환
frameSize = robot.TrackWidth/0.8;

while( distanceToGoal > goalRadius )
    
    % 로봇의 입력 계산
    [v, omega] = controller(robotCurrentPose);
    
    % 위 입력에 따른 속도 계산
    vel = derivative(robot, robotCurrentPose, [v omega]);
    
    % 현재 위치 업데이트
    robotCurrentPose = robotCurrentPose + vel*sampleTime; 
    
    % 목표 위치까지의 거리 계산
    distanceToGoal = norm(robotCurrentPose(1:2) - robotGoal(:));
    
    % 그래프 업데이트
    hold off
    
    % 로봇이 이동하는 동안의 plot 출력
    plot(path(:,1), path(:,2),"k--d")
    hold all

    plotTrVec = [robotCurrentPose(1:2); 0];
    plotRot = axang2quat([0 0 1 robotCurrentPose(3)]);
    plotTransforms(plotTrVec', plotRot, "MeshFilePath", "groundvehicle.stl", "Parent", gca, "View","2D", "FrameSize", frameSize);
    light;
    xlim([0 13])
    ylim([0 13])
    
    waitfor(vizRate);
end


