function plotVehicles(vehiclePlot, vehicleLabel, position, color)
%PLOTVEHICLES Update a vehicle's marker, label, and connection color.
%   PLOTVEHICLES(VEHICLEPLOT, VEHICLELABEL, POSITION, COLOR) moves
%   VEHICLEPLOT and VEHICLELABEL to POSITION and recolors the marker face
%   to COLOR ('g' = connected to 5G, 'b' = connected to 4G, 'r' = out of
%   range of both networks).

set(vehiclePlot, 'XData', position(1), 'YData', position(2), 'MarkerFaceColor', color);
set(vehicleLabel, 'Position', [position(1), position(2)]);

end
