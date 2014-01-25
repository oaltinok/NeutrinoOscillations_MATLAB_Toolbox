%% M_E_Probability Calculations
% Uses Common Constants and user inputs from GUI to calculate the Muon to
% Electron Neutrino Oscillation Probability



%% Specific Variables
% delta factors
delta_plus = delta + delta_m; 

% A variable with matter effect
A = (ve .* Energy .* rho) ./ (2 .* 1.27 .* DELTA_m31_sq);
A_prime = A .* (1 + eps(1));
A_dprime = A .* (1 + eps(1) - cos(theta23).^2 .* eps(3));
A_tprime = A .* (1 + eps(1) - (2.*sin(theta23).^2 - cos(theta23).^2) .* eps(3));


%% Other Common Factors

Q_bar = cos_2theta13_mod - A_dprime;

DELTA = 1.27.*DELTA_m31_sq.*distance ./ Energy;

G_ll = ((1+A)+alpha_dprime);

N_bar = sqrt((1-sin(theta12) .^2 .* alpha).^2+...
    4.*sin_2theta13_mod.*cos(theta23).*eps(2).*A.*cos(delta + delta_m) + ...
    4.* cos(theta23) .^2 .* (eps(2).*A) .^2 - ...
    2 .* cos_2theta13_mod .* A_dprime + A_dprime.^2);

eta_bar = sqrt(alpha_prime .^2 - ...
    4.*sin(theta23) .* cos(theta13) .* alpha_prime .* eps(2) .* A .* cos(delta_m) + ...
    4 .* sin(theta23) .^2 .* (eps(2) .* A) .^ 2 + ...
    2 .* sin(2*theta23) .* sin(theta13) .* alpha_prime .* eps(3) .* A .* cos(delta) + ...
    sin(2*theta23) .^2 .* (eps(3) .* A) .^ 2);



%% Complex Functions (f_bar = f_bar_0 + i f_bar_1 )
f_bar_0 = sin_2theta13_mod + 2 .* cos(theta23) .* eps(2) .* A .*cos(delta + delta_m);
f_bar_1 = 2 .* cos(theta23) .* eps(2) .* A .* sin(delta + delta_m);

f_bar = f_bar_0 + 1i .* f_bar_1; 

r_bar_0 = cos(theta13) .* alpha_prime - 2 .* sin(theta23) .* eps(2) .* A .* cos(delta_m);
r_bar_1 = -2 .* sin(theta23) .* eps(2) .* A .* sin(delta_m);

r_bar = r_bar_0 + 1i .* r_bar_1; 

b_bar_0 = sin(theta13) .* alpha_prime - sin(2*theta23) .* eps(3) .* A .* cos(delta);
b_bar_1 = -sin(2*theta23) .* eps(3) .* A .* sin(delta);

b_bar = b_bar_0 + 1i .* b_bar_1; 



%% Term 3(T3) Specific Factors
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


%% Calculate the Total Amplitude using all Terms (A = T1 + T2 + T3)
% T1 Amplitude
T1 = -sin(theta23) .* sin(DELTA .* N_bar) ./ N_bar .* ...
    ((f_bar_0 .* sin(delta) - f_bar_1 .* cos(delta)) + ... 
    1i .* (f_bar_0 .* cos(delta) + f_bar_1 .* sin(delta)));


% T2 Amplitude
T2 = cos(theta23) .* sin(DELTA .* eta_bar) ./ eta_bar .* ...
    ((r_bar_0 .* sin(DELTA .* G_ll) + r_bar_1 .* cos(DELTA .* G_ll)) + ...
    1i .*(-r_bar_0 .* cos(DELTA .* G_ll) + r_bar_1 .* sin(DELTA .* G_ll)));


% T3 Amplitude
T3=-2.*sin(theta23) .* sin(DELTA .* eta_bar ./ 2) .^2 .* ...
    (t3_real + 1i .* t3_imag);



Amplitude = T1 + T2 + T3;

%% Calculate the Probability using Total Amplitude
Probability = Amplitude .* conj(Amplitude);






    