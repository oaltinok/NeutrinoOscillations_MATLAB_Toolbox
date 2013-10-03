% Calculations and Plots

Get_Parameters_Flux;

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


Probability = Amplitude .* conj(Amplitude);

efficiency=0.69;
N_Neutrinos = Probability .* n_nu_mu_10 .* efficiency;






    