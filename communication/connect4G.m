function [isConnected, dataRate] = connect4G(distanceToTower, towerRadius4G, maxDataRate4G, minDataRate4G)
%CONNECT4G Check 4G coverage and estimate the resulting data rate.
%   [ISCONNECTED, DATARATE] = CONNECT4G(DISTANCETOTOWER, TOWERRADIUS4G,
%   MAXDATARATE4G, MINDATARATE4G) returns whether a vehicle at
%   DISTANCETOTOWER from the 4G tower is inside coverage, along with the
%   estimated data rate (see METRICS/CALCULATEDATARATE.M).

isConnected = distanceToTower <= towerRadius4G;
dataRate = 0;

if isConnected
    dataRate = calculateDataRate(distanceToTower, towerRadius4G, maxDataRate4G, minDataRate4G);
end

end
