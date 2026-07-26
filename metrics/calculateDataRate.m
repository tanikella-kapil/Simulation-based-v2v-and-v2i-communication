function rate = calculateDataRate(distance, radius, maxRate, minRate)
%CALCULATEDATARATE Linear distance-based data-rate fall-off model.
%   RATE = CALCULATEDATARATE(DISTANCE, RADIUS, MAXRATE, MINRATE) models
%   throughput as decreasing linearly from MAXRATE at the tower to 0 at
%   the edge of coverage (DISTANCE == RADIUS), then clamps the result to
%   the range [MINRATE, MAXRATE]. Shared by CONNECT5G and CONNECT4G so
%   the fall-off model only needs to be defined once.

rate = maxRate * (1 - distance / radius);
rate = max(min(rate, maxRate), minRate);

end
