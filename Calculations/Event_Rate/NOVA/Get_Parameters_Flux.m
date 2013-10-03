% This function is used to get all required constants

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

% theta factors
cos_2theta13_mod = cos(2.*theta13).*(1-sin(theta12).^2.*alpha);
sin_2theta13_mod = sin(2.*theta13).*(1-sin(theta12).^2.*alpha);

% delta factors
% delta = 0;
% delta_m = 0; 
delta_plus = delta + delta_m; 




% Matter Effect
% distance = 735;     %[km]
% rho = 2.72./2.72; 
% ve = 1./1900;        %[km.^-1] 
% Energy is ranging from [0,20] GeV
Energy = Flux_Energy_nu_mu_10;
A = (ve .* Energy.* rho) ./ (2.*1.27.*DELTA_m31_sq); 
A_prime = A .* (1 + epsilon_ee);
A_dprime = A .* (1+epsilon_ee - cos(theta23).^2 .* epsilon_tt);
A_tprime = A .* (1+epsilon_ee - (2.*sin(theta23).^2 - cos(theta23).^2) .* epsilon_tt);

Q_bar = cos_2theta13_mod - A_dprime;



% Complex Functions (f_bar = f_bar_0 + i f_bar_1 )

f_bar_0 = sin_2theta13_mod + 2 .* cos(theta23) .* epsilon_et .* A .*cos(delta + delta_m);
f_bar_1 = 2 .* cos(theta23) .* epsilon_et .* A .* sin(delta + delta_m);

f_bar = f_bar_0 + 1i .* f_bar_1; 

r_bar_0 = cos(theta13) .* alpha_prime - 2 .* sin(theta23) .* epsilon_et .* A .* cos(delta_m);
r_bar_1 = -2 .* sin(theta23) .* epsilon_et .* A .* sin(delta_m);

r_bar = r_bar_0 + 1i .* r_bar_1; 

b_bar_0 = sin(theta13) .* alpha_prime - sin(2*theta23) .* epsilon_tt .* A .* cos(delta);
b_bar_1 = -sin(2*theta23) .* epsilon_tt .* A .* sin(delta);

b_bar = b_bar_0 + 1i .* b_bar_1; 



% Other Common Factors
DELTA = 1.27.*DELTA_m31_sq.*distance ./ Energy;

G_ll = ((1+A)+alpha_dprime);

N_bar = sqrt((1-sin(theta12) .^2 .* alpha).^2+...
    4.*sin_2theta13_mod.*cos(theta23).*epsilon_et.*A.*cos(delta + delta_m) + ...
    4.* cos(theta23) .^2 .* (epsilon_et.*A) .^2 - ...
    2 .* cos_2theta13_mod .* A_dprime + A_dprime.^2);

eta_bar = sqrt(alpha_prime .^2 - ...
    4.*sin(theta23) .* cos(theta13) .* alpha_prime .* epsilon_et .* A .* cos(delta_m) + ...
    4 .* sin(theta23) .^2 .* (epsilon_et .* A) .^ 2 + ...
    2 .* sin(2*theta23) .* sin(theta13) .* alpha_prime .* epsilon_tt .* A .* cos(delta) + ...
    sin(2*theta23) .^2 .* (epsilon_tt .* A) .^ 2);


% T3 Factors

c13_sq_NSI = (r_bar_0 .^2 + r_bar_1 .^ 2) ./ (eta_bar .^2);

S1 = 1 ./ (eta_bar .^2) .* ...
    ((r_bar_0 .* b_bar_0 - r_bar_1 .* b_bar_1) + ...
    1i .* (r_bar_0 .* b_bar_1 + r_bar_1 .* b_bar_0));

S2 = (c13_sq_NSI .* f_bar_1 ./ N_bar + Q_bar ./ N_bar .* imag(S1))+ ...
    1i .* (-c13_sq_NSI .* f_bar_0 ./ N_bar - Q_bar ./ N_bar .* real(S1));


t3_real = (real(S1) .* cos(DELTA .* N_bar) + real(S2) .* sin(DELTA .* N_bar)) .* cos(delta) + ...
    (imag(S1) .* cos(DELTA .* N_bar) + imag(S2) .* sin(DELTA .* N_bar)) .* sin(delta);

t3_imag = (imag(S1) .* cos(DELTA .* N_bar) + imag(S2) .* sin(DELTA .* N_bar)) .* cos(delta) - ...
    (real(S1) .* cos(DELTA .* N_bar) + real(S2) .* sin(DELTA .* N_bar)) .* sin(delta);


