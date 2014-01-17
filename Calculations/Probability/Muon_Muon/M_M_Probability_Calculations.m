% Energy is ranging from [0,20] GeV
Energy = linspace(0.4,10,1000);

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

cos_2theta13_mod = cos(2.*theta13).*(1-sin(theta12).^2.*alpha);
sin_2theta13_mod = sin(2.*theta13).*(1-sin(theta12).^2.*alpha);


A = (ve .* Energy .* rho) ./ (2 .* 1.27 .* DELTA_m31_sq);


DELTA_0 = 1.27 .* DELTA_m31_sq ./ Energy;
DELTA_L = DELTA_0 .* distance;

G_ll = DELTA_L .* ( (1+A) + alpha_dprime);

d = cos(DELTA_L .* alpha_prime);


D = sqrt(sin_2theta13_mod.^2 + (cos_2theta13_mod - A).^2);

nx = sin_2theta13_mod ./ D;
nz = ( -1 .* (cos_2theta13_mod - A ) ) ./ D;

gamma = cos(DELTA_L .* D) + 1i .* nz .* sin(DELTA_L .* D);

beta = nx .* sin(DELTA_L .* D);

a = DELTA_0 .* cos(theta13) .* alpha_prime;
b = DELTA_0 .* ( -sin(theta13) .* alpha_prime);
eta = DELTA_0 .* alpha_prime;

u_bar = ((gamma .* a + 1i .* beta .* b) ./ eta ) .* exp( 1i .* G_ll);
v_bar = ((gamma .* b - 1i .* beta .* a) ./ eta ) .* exp( -1i .* G_ll);

k = v_bar .* sin( DELTA_L .* alpha_prime);
E = u_bar .* sin( DELTA_L .* alpha_prime);

Dv = 1 - 2 .* v_bar .* conj(v_bar) .* sin(DELTA_L .* alpha_prime ./ 2).^2;
p = - 2 .* u_bar .* v_bar .* sin(DELTA_L .* alpha_prime ./ 2).^2;


A1 = cos(theta23).^2 .*d .* exp( 1i .* G_ll);

A2 = cos(theta23) .* sin(theta23) .* ( -1i .* k ) .* exp( 1i .* ( G_ll - delta));

A3 = cos(theta23) .* sin(theta23) .* (gamma .* ( -1i .* conj(k)) - beta .* E) ...
    .* exp( 1i .* delta);

A4 = sin(theta23).^2 .* ( gamma .* Dv - 1i .* beta .* p);


Amplitude = A1 + A2 + A3 + A4;
 
Probability =(Amplitude .* conj(Amplitude));





