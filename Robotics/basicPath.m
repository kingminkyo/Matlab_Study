clc, clear 
load exampleMaps.mat
%whos *Map*
map = binaryOccupancyMap(simpleMap,2);
%show(map)

robotRadius = 0.2;
mapInflated = copy(map);
inflate(mapInflated,robotRadius);
%show(mapInflated)

prm = mobileRobotPRM;
prm.Map = mapInflated;
prm.NumNodes = 50;
prm.ConnectionDistance = 5;
startLocation = [2 1];
endLocation = [12 10];
path = findpath(prm, startLocation, endLocation);
show(prm)