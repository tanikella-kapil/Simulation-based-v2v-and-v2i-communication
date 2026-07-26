function [isConnected, dataRate] = connect5G(distanceToTower, towerRadius5G, maxDataRate5G, minDataRate5G)
%CONNECT5G Check 5G coverage and estimate the resulting data rate.
%   [ISCONNECTED, DATARATE] = CONNECT5G(DISTANCETOTOWER, TOWERRADIUS5G,
%   MAXDATARATE5G, MINDATARATE5G) returns whether a vehicle at
%   DISTANCETOTOWER from its nearest 5G tower is inside coverage, along
%   with the estimated data rate (see METRICS/CALCULATEDATARATE.M).

isConnected = distanceToTower <= towerRadius5G;
dataRate = 0;

if isConnected
    dataRate = calculateDataRate(distanceToTower, towerRadius5G, maxDataRate5G, minDataRate5G);
end

end
