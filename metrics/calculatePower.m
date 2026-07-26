function powerConsumption = calculatePower(vehiclePositions, towerPositions5G, towerRadius5G, ...
    towerPositions4G, towerRadius4G, baseStationPower)
%CALCULATEPOWER Estimate network-side power draw for one time step.
%   POWERCONSUMPTION = CALCULATEPOWER(VEHICLEPOSITIONS, TOWERPOSITIONS5G,
%   TOWERRADIUS5G, TOWERPOSITIONS4G, TOWERRADIUS4G, BASESTATIONPOWER)
%   counts how many vehicles are within range of any 5G tower or the 4G
%   tower, and multiplies that count by BASESTATIONPOWER (a simple
%   per-connection power model).

numVehicles = size(vehiclePositions, 1);
connectedVehicles = 0;

for v = 1:numVehicles
    within5G = any(vecnorm(vehiclePositions(v, :) - towerPositions5G, 2, 2) <= towerRadius5G);
    within4G = norm(vehiclePositions(v, :) - towerPositions4G) <= towerRadius4G;

    if within5G || within4G
        connectedVehicles = connectedVehicles + 1;
    end
end

powerConsumption = baseStationPower * connectedVehicles;

end
