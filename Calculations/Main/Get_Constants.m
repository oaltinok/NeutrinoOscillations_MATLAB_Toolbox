%% This script is used to get all required constants
% After this script is called the constants appear at the workspace
% These constants are used for all Probability and Event Rate Calculations

%% Mixing Angles
% theta13 from Daya Bay Result
sinsq_2theta13 = 0.092;                 % [degrees] 
sin_2theta13 = sqrt(sinsq_2theta13);
theta13 = asin(sin_2theta13)./2;        % [radians]

% theta23
theta23_degree = 45;                    % [degrees]
theta23 = theta23_degree .* pi./180;    % [radians]

% theta 12
theta12_degree = 34.45;                 % [degrees]
theta12 = theta12_degree .* pi./180;    % [radians]

%% Mass Eigenstate Differences
DELTA_m31_sq = 2.35e-3;
DELTA_m21_sq = 7.54e-5;

%% Alpha Factors
alpha = DELTA_m21_sq ./ DELTA_m31_sq;
alpha_prime = sin(2.*theta12).*alpha;
alpha_dprime = (1-3.*cos(theta12).^2).*alpha;

%% Theta Factors
cos_2theta13_mod = cos(2.*theta13).*(1-sin(theta12).^2.*alpha);
sin_2theta13_mod = sin(2.*theta13).*(1-sin(theta12).^2.*alpha);

