% This script is used to get all required constants

% Constants
% theta13
% sinsq_2theta13 = 0.11;
sinsq_2theta13 = 0.092; % Daya Bay Result
sin_2theta13 = sqrt(sinsq_2theta13);
theta13 = asin(sin_2theta13)./2;       % [radians]

% theta23
theta23_degree = 45;                 % [degrees]
theta23 = theta23_degree .* pi./180;   % [radians]

% theta 12
theta12_degree = 34.45;              % [degrees]
theta12 = theta12_degree .* pi./180;   % [radians]


% mass factor
% DELTA_m31_sq = 2.35e-3;
DELTA_m21_sq=7.54e-5;

% alpha factors
alpha = DELTA_m21_sq ./ DELTA_m31_sq;
alpha_prime = sin(2.*theta12).*alpha;
alpha_dprime = (1-3.*cos(theta12).^2).*alpha;



% Energy is ranging from [0,20] GeV
Energy = linspace(0.4,10,1000);

A = (ve .* Energy .* rho) ./ (2 .* 1.27 .* DELTA_m31_sq); 

DELTA_0 = 1.27 .* DELTA_m31_sq ./ Energy;

DELTA_L = DELTA_0 .* distance;

G_ll = DELTA_L .* ( (1+A) + alpha_dprime);

d = cos(DELTA_L .* alpha_prime);










% 