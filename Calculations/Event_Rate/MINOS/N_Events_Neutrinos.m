
%  ktpot=36.9;
ktpot=47.7;
 
%  % Number of beam nu_e events/200MeV (no oscillations)
%  n_nu_e=(4.076*10^-6)*ktpot .*Flux_nu_e.*Flux_Energy;
 
 % Number of beam nu_mu events/200MeV (no oscillations)
 n_nu_mu=(4.076*10^-6)*ktpot.*Flux_nu_mu.*Flux_Energy_nu_mu;
 
%  % Number of beam nu_e_bar events/200MeV (no oscillations)
%  n_nu_e_bar=(2.011*10^-6)*ktpot.*Flux_nu_e_bar.*Flux_Energy;
%  
%  % Number of beam nu_mu_bar events/200MeV (no oscillations)
%  n_nu_mu_bar=(2.011*10^-6)*ktpot.*Flux_nu_mu_bar.*Flux_Energy;
 

 
%  % Number of beam nu_e events/200MeV (no oscillations) [0.2,10] GeV
%  n_nu_e_10=n_nu_e(2:50);
  
%  Number of beam nu_mu events/200MeV (no oscillations) [0.2,10] GeV
 n_nu_mu_10=n_nu_mu(5:40);
 
%  % Number of beam nu_e events/200MeV (no oscillations) [0.2,10] GeV
%  n_nu_e_bar_10=n_nu_e_bar(2:50);
%  
%  % Number of beam nu_mu events/200MeV (no oscillations) [0.2,10] GeV
%  n_nu_mu_bar_10=n_nu_mu_bar(2:50);
 

% bar(Flux_Energy_nu_mu_10,n_nu_mu_10);
% xlabel('Energy [GeV]');
% ylabel('N(\nu_{\mu})');
% xlim([0 10]);


 
%  f_cc_mu = 0.004;
%  ee=0.85;
%  
%  % Number of beam nu_mu events/200MeV [0.2,10] GeV
%  n_nu_mu_osc = n_nu_mu_10.*(1-(sin(2*theta23))).^2 .* (sin(1.27.*DELTA_m31_sq.*distance./Energy).^2);
%  n_nu_mu_osc = f_cc_mu*n_nu_mu_osc;
%  
%  % Number of beam nu_mu_bar events/200MeV [0.2,10] GeV
%  n_nu_mu_bar_osc = n_nu_mu_bar_10.*(1-(sin(2*theta23))).^2 .* (sin(1.27.*DELTA_m31_sq*distance./Energy).^2);
%  n_nu_mu_bar_osc = f_cc_mu*n_nu_mu_bar_osc;
%  
%  n_nu_e_ob=ee*n_nu_e_10;