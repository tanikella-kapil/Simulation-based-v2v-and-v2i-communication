function cfg = config()
%CONFIG Simulation configuration for the 5G/4G V2X communication model.
%   CFG = CONFIG() returns a struct containing every tunable parameter
%   used throughout the simulation (network, vehicle, and radio-access
%   parameters). Road geometry lives in ROADS/CREATEROADS.M and base
%   station placement lives in TOWERS/CREATETOWERS.M.
%
%   Modify the values below to explore different network and traffic
%   scenarios without touching any simulation logic elsewhere in the
%   repository.

% ---------------- General simulation parameters ----------------
cfg.towerRadius5G        = 50;   % Coverage radius of each 5G tower (m)
cfg.towerRadius4G        = 70;   % Coverage radius of the 4G tower (m)
cfg.numVehicles          = 6;    % Number of vehicles to simulate
cfg.simulationTime       = 100;  % Total simulation time (s)
cfg.timeStep             = 0.5;  % Simulation time step (s)
cfg.minVehicleSpeed      = 20;   % Minimum vehicle speed (m/s)
cfg.maxVehicleSpeed      = 80;   % Maximum vehicle speed (m/s)
cfg.v2vDistanceThreshold = 20;   % Distance below which a V2V proximity warning fires (m)
cfg.handoverThreshold    = 10;   % Distance below which a 5G handover is logged (m)
cfg.minSafeDistance      = 5;    % Minimum safe following distance (m)
cfg.baseStationPower     = 0.1;  % Power drawn per connected vehicle (W)

% ---------------- 5G radio-access parameters ----------------
cfg.maxDataRate5G = 1000; % Maximum 5G data rate (Mbps)
cfg.minDataRate5G = 100;  % Minimum 5G data rate (Mbps)
cfg.mimoAntennas  = 8;    % Antennas per 5G tower (MIMO configuration)

% ---------------- 4G radio-access parameters ----------------
cfg.maxDataRate4G = 300;  % Maximum 4G data rate (Mbps)
cfg.minDataRate4G = 50;   % Minimum 4G data rate (Mbps)

% ---------------- DSRC parameters ----------------
cfg.dsrcRange   = 300;    % DSRC V2V communication range (m)
cfg.dsrcLatency = 0.01;   % DSRC message latency (s)

end
