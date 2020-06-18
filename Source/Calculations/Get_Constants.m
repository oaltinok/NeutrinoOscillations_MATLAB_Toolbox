%% This script is used to get all required constants
% After this script is called the constants appear at the workspace
% These constants are used for all Probability and Event Rate Calculations

%% Mixing Angles
% theta13 from Daya Bay Result
sinsq_2theta13 = 0.092;                 % [degrees] 
sin_2theta13 = sqrt(sinsq_2theta13);
theta13 = asin(sin_2theta13)./2;        % [radians]

% theta 12
theta12_degree = 34.45;                 % [degrees]
theta12 = theta12_degree .* pi./180;    % [radians]

%% Mass Eigenstate Differences
DELTA_m21_sq = 7.54e-5;
