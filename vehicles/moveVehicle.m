function [newPosition, newSegment] = moveVehicle(position, segment, roadCoords, speed, timeStep)
%MOVEVEHICLE Advance one vehicle along its road by one time step.
%   [NEWPOSITION, NEWSEGMENT] = MOVEVEHICLE(POSITION, SEGMENT, ROADCOORDS,
%   SPEED, TIMESTEP) moves POSITION along the direction of the current
%   road SEGMENT by SPEED*TIMESTEP metres. Once the vehicle is within one
%   step of the segment's end waypoint, it snaps to the start of the next
%   segment, looping back to the first segment after the last one.

segmentVector = roadCoords(segment + 1, :) - roadCoords(segment, :);
segmentLength = norm(segmentVector);
direction = segmentVector / segmentLength;

newPosition = position + direction * speed * timeStep;
newSegment = segment;

if norm(newPosition - roadCoords(segment + 1, :)) < speed * timeStep
    newSegment = mod(segment, size(roadCoords, 1) - 1) + 1;
    newPosition = roadCoords(newSegment, :);
end

end
