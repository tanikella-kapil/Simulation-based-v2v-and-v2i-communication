function [towerPositions5G, towerPositions4G] = createTowers()
%CREATETOWERS Define base-station locations for the simulation.
%   [TOWERPOSITIONS5G, TOWERPOSITIONS4G] = CREATETOWERS() returns the
%   (x, y) coordinates, in metres, of the three 5G small cells and the
%   single 4G macro cell shared across all road scenarios. The 5G towers
%   are laid out so their hexagonal coverage footprints share edges.

towerPositions5G = [100, 100; 175, 143.301; 100, 100 + 86.602];
towerPositions4G = [20, 150];

end
