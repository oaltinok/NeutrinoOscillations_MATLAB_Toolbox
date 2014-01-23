%% M_E_Probability Calculations
% Uses Common Constants and user inputs from GUI to calculate the Muon to
% Muon Neutrino Oscillation Probability (Survival Probability)

%% Specific Variables

% A Variable
A = (ve .* Energy .* rho) ./ (2 .* 1.27 .* DELTA_m31_sq);

%% Other Common Factors
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

%% Complex Functions (u_bar & v_bar )
u_bar = ((gamma .* a + 1i .* beta .* b) ./ eta ) .* exp( 1i .* G_ll);
v_bar = ((gamma .* b - 1i .* beta .* a) ./ eta ) .* exp( -1i .* G_ll);

k = v_bar .* sin( DELTA_L .* alpha_prime);
E = u_bar .* sin( DELTA_L .* alpha_prime);

Dv = 1 - 2 .* v_bar .* conj(v_bar) .* sin(DELTA_L .* alpha_prime ./ 2).^2;
p = - 2 .* u_bar .* v_bar .* sin(DELTA_L .* alpha_prime ./ 2).^2;


%% Calculate the Total Amplitude using all Terms (A = T1 + T2 + T3 + T4)
T1 = cos(theta23).^2 .*d .* exp( 1i .* G_ll);

T2 = cos(theta23) .* sin(theta23) .* ( -1i .* k ) .* exp( 1i .* ( G_ll - delta));

T3 = cos(theta23) .* sin(theta23) .* (gamma .* ( -1i .* conj(k)) - beta .* E) ...
    .* exp( 1i .* delta);

T4 = sin(theta23).^2 .* ( gamma .* Dv - 1i .* beta .* p);


Amplitude = T1 + T2 + T3 + T4;

%% Calculate the Probability using Total Amplitude
Probability =(Amplitude .* conj(Amplitude));





