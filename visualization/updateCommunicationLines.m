function updateCommunicationLines(commLine, vehiclePosition, targetPosition, color)
%UPDATECOMMUNICATIONLINES Draw or hide a vehicle's V2I link.
%   UPDATECOMMUNICATIONLINES(COMMLINE, VEHICLEPOSITION, TARGETPOSITION,
%   COLOR) draws COMMLINE from VEHICLEPOSITION to TARGETPOSITION in
%   COLOR. Pass an empty TARGETPOSITION (i.e. []) to hide the line when
%   the vehicle has no V2I connection.

if isempty(targetPosition)
    set(commLine, 'XData', [NaN, NaN], 'YData', [NaN, NaN]);
else
    set(commLine, 'XData', [vehiclePosition(1), targetPosition(1)], ...
                  'YData', [vehiclePosition(2), targetPosition(2)], ...
                  'Color', color);
end

end
