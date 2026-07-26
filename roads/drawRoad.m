function drawRoad(roadCoords, roadName)
%DRAWROAD Plot a road's centreline on the current axes.
%   DRAWROAD(ROADCOORDS, ROADNAME) draws the waypoints in ROADCOORDS as a
%   black polyline and adds a title, axis labels, and a grid for
%   ROADNAME. Call this after opening a figure and before plotting
%   towers or vehicles on top of it.

plot(roadCoords(:, 1), roadCoords(:, 2), '-k', 'LineWidth', 2);
title([roadName ' Road Structure with 4G and 5G Towers']);
xlabel('X Coordinate (m)');
ylabel('Y Coordinate (m)');
grid on;
axis equal;

end
