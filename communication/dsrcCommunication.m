function dsrcCommunication(vehiclePositions, vehicleSpeeds, j, dsrcRange, dsrcLatency)
%DSRCCOMMUNICATION Simulate DSRC-based V2V beaconing for vehicle j.
%   DSRCCOMMUNICATION(VEHICLEPOSITIONS, VEHICLESPEEDS, J, DSRCRANGE,
%   DSRCLATENCY) checks every other vehicle against DSRCRANGE and, for
%   each one in range, logs a DSRC message exchange (position and speed
%   share) after waiting DSRCLATENCY seconds to emulate message latency.

numVehicles = size(vehiclePositions, 1);

for k = 1:numVehicles
    if j ~= k
        distanceToVehicle = norm(vehiclePositions(j, :) - vehiclePositions(k, :));
        if distanceToVehicle <= dsrcRange
            fprintf('Vehicle %d is communicating with Vehicle %d via DSRC.\n', j, k);

            pause(dsrcLatency);

            fprintf('Vehicle %d shares position [%0.2f, %0.2f] and speed %0.2f m/s with Vehicle %d.\n', ...
                j, vehiclePositions(j, 1), vehiclePositions(j, 2), vehicleSpeeds(j), k);
        end
    end
end

end
