function [vehiclePositions, vehicleSegments, vehicleSpeeds] = initializeVehicles( ...
    roadCoords, numVehicles, minVehicleSpeed, maxVehicleSpeed)
%INITIALIZEVEHICLES Randomly place vehicles on a road and assign speeds.
%   [VEHICLEPOSITIONS, VEHICLESEGMENTS, VEHICLESPEEDS] = INITIALIZEVEHICLES(
%   ROADCOORDS, NUMVEHICLES, MINVEHICLESPEED, MAXVEHICLESPEED) picks a
%   random road segment and a random point along it for each vehicle, and
%   draws each vehicle's cruising speed uniformly from
%   [MINVEHICLESPEED, MAXVEHICLESPEED].
%
%   VEHICLESEGMENTS(j) is the index of the road waypoint that starts the
%   segment vehicle j currently occupies (so the segment runs from
%   ROADCOORDS(VEHICLESEGMENTS(j), :) to ROADCOORDS(VEHICLESEGMENTS(j)+1, :)).

numSegments = size(roadCoords, 1) - 1;
vehicleSegments = randi(numSegments, numVehicles, 1);
vehiclePositions = zeros(numVehicles, 2);
vehicleSpeeds = minVehicleSpeed + (maxVehicleSpeed - minVehicleSpeed) * rand(numVehicles, 1);

for j = 1:numVehicles
    segmentStart = roadCoords(vehicleSegments(j), :);
    segmentEnd = roadCoords(vehicleSegments(j) + 1, :);
    t = rand; % Random proportion along the segment
    vehiclePositions(j, :) = segmentStart + t * (segmentEnd - segmentStart);
end

end
