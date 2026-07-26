function main()
%MAIN Entry point for the 5G/4G V2X (V2V + V2I) communication simulation.
%   Reproduces the simulation environment described in the accompanying
%   IEEE paper: vehicles travel along four road topologies while
%   connecting to a mix of 5G small cells and a 4G macro cell, and
%   exchange basic safety information with nearby vehicles over DSRC.
%
%   Run this file directly (or type MAIN at the MATLAB command prompt)
%   to reproduce all four road-scenario figures. No toolboxes are
%   required beyond base MATLAB (R2017b+, for VECNORM).

close all;
clc;

% Make every module folder visible regardless of the current directory
repoRoot = fileparts(mfilename('fullpath'));
addpath(fullfile(repoRoot, 'roads'));
addpath(fullfile(repoRoot, 'towers'));
addpath(fullfile(repoRoot, 'vehicles'));
addpath(fullfile(repoRoot, 'communication'));
addpath(fullfile(repoRoot, 'metrics'));
addpath(fullfile(repoRoot, 'visualization'));

cfg = config();
[roadTypes, roadCoords] = createRoads();
[towerPositions5G, towerPositions4G] = createTowers();

for i = 1:length(roadTypes)
    figure('Name', roadTypes{i}, 'NumberTitle', 'off');
    hold on;

    drawRoad(roadCoords{i}, roadTypes{i});
    plotTowers(towerPositions5G, cfg.towerRadius5G, towerPositions4G, cfg.towerRadius4G);

    [vehiclePositions, vehicleSegments, vehicleSpeeds] = initializeVehicles( ...
        roadCoords{i}, cfg.numVehicles, cfg.minVehicleSpeed, cfg.maxVehicleSpeed);

    % Graphics handles for each vehicle
    vehiclePlots = gobjects(cfg.numVehicles, 1);
    v2iCommLines = gobjects(cfg.numVehicles, 1);
    vehicleLabels = gobjects(cfg.numVehicles, 1);
    for j = 1:cfg.numVehicles
        vehiclePlots(j) = plot(vehiclePositions(j, 1), vehiclePositions(j, 2), ...
            'ro', 'MarkerSize', 8, 'LineWidth', 1.5);
        v2iCommLines(j) = plot([vehiclePositions(j, 1), NaN], [vehiclePositions(j, 2), NaN], 'g-');
        vehicleLabels(j) = text(vehiclePositions(j, 1), vehiclePositions(j, 2), ['V' num2str(j)], ...
            'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    end

    for t = 1:cfg.timeStep:cfg.simulationTime
        for j = 1:cfg.numVehicles
            % --- Motion update ---------------------------------------------
            [vehiclePositions(j, :), vehicleSegments(j)] = moveVehicle( ...
                vehiclePositions(j, :), vehicleSegments(j), roadCoords{i}, ...
                vehicleSpeeds(j), cfg.timeStep);

            % --- Collision avoidance -----------------------------------------
            vehicleSpeeds(j) = collisionDetection(vehiclePositions, j, vehicleSpeeds(j), ...
                cfg.v2vDistanceThreshold, cfg.minSafeDistance, cfg.minVehicleSpeed);

            % --- V2I: handover + connectivity ---------------------------------
            [nearest5GIdx, distanceTo5G] = handover(vehiclePositions(j, :), ...
                towerPositions5G, cfg.handoverThreshold, j);
            distanceTo4G = norm(vehiclePositions(j, :) - towerPositions4G);

            [connected5G, dataRate5G] = connect5G(distanceTo5G, cfg.towerRadius5G, ...
                cfg.maxDataRate5G, cfg.minDataRate5G);
            [connected4G, dataRate4G] = connect4G(distanceTo4G, cfg.towerRadius4G, ...
                cfg.maxDataRate4G, cfg.minDataRate4G);

            if connected5G
                color = 'g';
                targetPos = towerPositions5G(nearest5GIdx, :);
                fprintf('Vehicle %d is communicating with 5G Tower %d (V2I) at %d Mbps\n', ...
                    j, nearest5GIdx, round(dataRate5G));
            elseif connected4G
                color = 'b';
                targetPos = towerPositions4G;
                fprintf('Vehicle %d is communicating with 4G Tower (V2I) at %d Mbps\n', ...
                    j, round(dataRate4G));
            else
                color = 'r';
                targetPos = [];
                fprintf('Vehicle %d is out of range of both 5G and 4G networks\n', j);
            end

            plotVehicles(vehiclePlots(j), vehicleLabels(j), vehiclePositions(j, :), color);
            updateCommunicationLines(v2iCommLines(j), vehiclePositions(j, :), targetPos, color);

            % --- V2V: DSRC broadcast -------------------------------------------
            dsrcCommunication(vehiclePositions, vehicleSpeeds, j, cfg.dsrcRange, cfg.dsrcLatency);
        end

        % --- Network energy footprint for this time step -----------------------
        powerConsumption = calculatePower(vehiclePositions, towerPositions5G, cfg.towerRadius5G, ...
            towerPositions4G, cfg.towerRadius4G, cfg.baseStationPower);
        fprintf('Power: %.2f W\n', powerConsumption);

        pause(0.1); % Slow down the loop to visualize real-time movement
    end
end

end
