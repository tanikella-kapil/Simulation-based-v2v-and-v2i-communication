function plotTowers(towerPositions5G, towerRadius5G, towerPositions4G, towerRadius4G)
%PLOTTOWERS Draw base stations and their coverage areas on the current axes.
%   PLOTTOWERS(TOWERPOSITIONS5G, TOWERRADIUS5G, TOWERPOSITIONS4G,
%   TOWERRADIUS4G) draws each 5G tower with a hexagonal coverage
%   footprint of radius TOWERRADIUS5G, and the 4G tower with a circular
%   coverage footprint of radius TOWERRADIUS4G.

numTowers5G = size(towerPositions5G, 1);

% 5G towers: hexagonal coverage areas
angle = linspace(0, 2 * pi, 7); % 7 points closes the hexagon
for t = 1:numTowers5G
    hexagonX = towerRadius5G * cos(angle) + towerPositions5G(t, 1);
    hexagonY = towerRadius5G * sin(angle) + towerPositions5G(t, 2);

    fill(hexagonX, hexagonY, 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
    plot(towerPositions5G(t, 1), towerPositions5G(t, 2), 'kp', 'MarkerSize', 12, 'LineWidth', 2);
end

% 4G tower: circular coverage area
theta = linspace(0, 2 * pi, 100);
xCircle = towerRadius4G * cos(theta) + towerPositions4G(1);
yCircle = towerRadius4G * sin(theta) + towerPositions4G(2);

fill(xCircle, yCircle, 'b', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(towerPositions4G(1), towerPositions4G(2), 'kp', 'MarkerSize', 12, 'LineWidth', 2);

end
