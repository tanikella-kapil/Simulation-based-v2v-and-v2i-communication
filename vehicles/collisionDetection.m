function newSpeed = collisionDetection(vehiclePositions, j, currentSpeed, ...
    v2vDistanceThreshold, minSafeDistance, minVehicleSpeed)
%COLLISIONDETECTION Basic proximity-based collision avoidance for vehicle j.
%   NEWSPEED = COLLISIONDETECTION(VEHICLEPOSITIONS, J, CURRENTSPEED,
%   V2VDISTANCETHRESHOLD, MINSAFEDISTANCE, MINVEHICLESPEED) compares
%   vehicle J against every other vehicle in VEHICLEPOSITIONS. A warning
%   is printed whenever another vehicle is within V2VDISTANCETHRESHOLD;
%   if any vehicle is within the stricter MINSAFEDISTANCE, the returned
%   speed is floored to MINVEHICLESPEED. Otherwise NEWSPEED equals
%   CURRENTSPEED unchanged.
%
%   NOTE: this mirrors the original model, where a vehicle that has been
%   slowed to MINVEHICLESPEED is never sped back up automatically once
%   the other vehicle moves away.

numVehicles = size(vehiclePositions, 1);
newSpeed = currentSpeed;

for k = 1:numVehicles
    if j ~= k
        distanceBetweenVehicles = norm(vehiclePositions(j, :) - vehiclePositions(k, :));
        if distanceBetweenVehicles < v2vDistanceThreshold
            fprintf('Warning: Vehicle %d close to Vehicle %d\n', j, k);

            if distanceBetweenVehicles < minSafeDistance
                newSpeed = minVehicleSpeed;
            end
        end
    end
end

end
