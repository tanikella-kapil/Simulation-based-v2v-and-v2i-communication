function [roadTypes, roadCoords] = createRoads()
%CREATEROADS Define the road topologies used in the simulation.
%   [ROADTYPES, ROADCOORDS] = CREATEROADS() returns a cell array of road
%   names and a matching cell array of waypoint matrices (one Nx2 matrix
%   per road, columns = [x, y] in metres). Vehicles travel along these
%   waypoints in order, looping back to the first one after the last.

roadTypes = {'Square', 'Triangle', 'Straight', 'Zigzag'};

roadCoords = {
    [50 60; 50 160; 150 160; 150 60; 50 60];            % Square road
    [50 100; 100 200; 150 100; 50 100];                 % Triangle road
    [0 100; 250 100];                                   % Straight road
    [0 50; 50 100; 100 150; 150 100; 200 150; 250 100]  % Zigzag road
};

end
