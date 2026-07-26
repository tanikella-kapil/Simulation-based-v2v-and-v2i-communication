function [nearestTowerIndex, minDistance] = handover(vehiclePosition, towerPositions5G, ...
    handoverThreshold, vehicleIndex)
%HANDOVER Identify a vehicle's nearest 5G tower and report handovers.
%   [NEARESTTOWERINDEX, MINDISTANCE] = HANDOVER(VEHICLEPOSITION,
%   TOWERPOSITIONS5G, HANDOVERTHRESHOLD, VEHICLEINDEX) returns the index
%   and distance of the 5G tower closest to VEHICLEPOSITION. A handover
%   message is printed for VEHICLEINDEX whenever that distance falls
%   below HANDOVERTHRESHOLD.

distancesToTowers5G = vecnorm(vehiclePosition - towerPositions5G, 2, 2);
[minDistance, nearestTowerIndex] = min(distancesToTowers5G);

if minDistance < handoverThreshold
    fprintf('Vehicle %d handover to Tower %d\n', vehicleIndex, nearestTowerIndex);
end

end
