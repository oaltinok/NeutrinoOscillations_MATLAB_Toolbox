% Reading Flux File
Flux_Matrix_nu_mu=load('Flux_Files/le-1000-0.txt');

% Getting Parameters


Flux_Energy_nu_mu = reshape(Flux_Matrix_nu_mu(:,1),4,250);
Flux_Energy_nu_mu = mean(Flux_Energy_nu_mu);
Flux_Energy_nu_mu = Flux_Energy_nu_mu(1:100); 

Flux_Energy_nu_mu_10 = Flux_Energy_nu_mu(5:40);

% Flux_nu_e = reshape(Flux_Matrix(:,2),4,250);
% Flux_nu_e = 4*mean(Flux_nu_e);
% Flux_nu_e = (1000/735)^2 .* Flux_nu_e(1:100);

Flux_nu_mu = reshape(Flux_Matrix_nu_mu(:,3),4,250);
Flux_nu_mu = 4*mean(Flux_nu_mu);
Flux_nu_mu = (1000/735)^2 .*Flux_nu_mu(1:100);
 
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

N_Events_Neutrinos;








