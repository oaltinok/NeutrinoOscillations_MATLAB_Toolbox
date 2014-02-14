function [Flux_Energy_nu_mu_10,n_nu_mu_10] = Read_Flux_Files(experiment)

% Reading Flux File
% experiment = 1 for MINOS
% experiment = 0 for NOVA
if experiment == 1
    Flux_Matrix_nu_mu = load('FluxFiles/le-1000-0.txt');
else
    Flux_Matrix_nu_mu = load('FluxFiles/me-1000-14.txt');
    
end

ktpot = 47.7;

% Only Use Muon Neutrino Values
% Getting Parameters
Flux_Energy_nu_mu = reshape(Flux_Matrix_nu_mu(:,1),4,250);
Flux_Energy_nu_mu = mean(Flux_Energy_nu_mu);
Flux_Energy_nu_mu = Flux_Energy_nu_mu(1:100); 

Flux_Energy_nu_mu_10 = Flux_Energy_nu_mu(5:40);

Flux_nu_mu = reshape(Flux_Matrix_nu_mu(:,3),4,250);
Flux_nu_mu = 4*mean(Flux_nu_mu);
Flux_nu_mu = (1000/735)^2 .*Flux_nu_mu(1:100);

% Number of beam nu_mu events/200MeV (no oscillations)
n_nu_mu = (4.076 * 10^-6) * ktpot .* Flux_nu_mu .* Flux_Energy_nu_mu;
n_nu_mu_10 = n_nu_mu(5:40);

%% Other Fluxes
% Flux_nu_e = reshape(Flux_Matrix(:,2),4,250);
% Flux_nu_e = 4*mean(Flux_nu_e);
% Flux_nu_e = (1000/735)^2 .* Flux_nu_e(1:100);
 
% Flux_nu_tau = reshape(Flux_Matrix(:,4),4,250);
% Flux_nu_tau = 4*mean(Flux_nu_tau);
% Flux_nu_tau = (1000/735)^2 .*Flux_nu_tau(1:100);
% 
% Flux_nu_e_bar = reshape(Flux_Matrix(:,5),4,250);
% Flux_nu_e_bar = 4*mean(Flux_nu_e_bar);
% Flux_nu_e_bar = (1000/735)^2 .*Flux_nu_e_bar(1:100);
% 
% Flux_nu_mu_bar = reshape(Flux_Matrix(:,6),4,250);
% Flux_nu_mu_bar = 4*mean(Flux_nu_mu_bar);
% Flux_nu_mu_bar = (1000/735)^2 .*Flux_nu_mu_bar(1:100);
% 
% Flux_nu_tau_bar = reshape(Flux_Matrix(:,7),4,250);
% Flux_nu_tau_bar = 4*mean(Flux_nu_tau_bar);
% Flux_nu_tau_bar = (1000/735)^2 .*Flux_nu_tau_bar(1:100);










