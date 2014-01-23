function [check_par] = Get_EventRate(...
    dirac_delta,...
    NSI_delta,...
    h1,...
    t1,...
    eps_et_nsi,...
    eps_ee_nsi,...
    eps_tt_nsi,...
    wb,...
    experiment,...
    Plot_Color)

%% Read Flux Files
waitbar(0.2,wb,'Reading Flux Files')

[Flux_Energy_nu_mu_10,n_nu_mu_10] = Read_Flux_Files(experiment);

% Load Common Constants
Get_Constants;

%% Set Distance Parameter for Experiment
% experiment = 1 for MINOS
% experiment = 0 for NOVA
if experiment == 1
    distance = 735; 
else
    distance = 810;
end
    
rho = Get_Density(distance);

epsilon_et = eps_et_nsi;
epsilon_ee = eps_ee_nsi;
epsilon_tt = eps_tt_nsi;

waitbar(0.5,wb,'Making Calculations')


% Set Energy Range
% Energy is calculated from Flux Files
Energy = Flux_Energy_nu_mu_10;

% Assign epsilon values
epsilon_et = eps_et_nsi;
epsilon_ee = eps_ee_nsi;
epsilon_tt = eps_tt_nsi;

%% Change Variables and Form Legend String using the user input
% Mass Hierarchy: Normal = 1, Inverted = 0
if h1 == 1
    legend_mass = sprintf('NH');
else
    DELTA_m31_sq = -1 * DELTA_m31_sq;
    legend_mass = sprintf('IH');
end

% Particle Type:  Neutrino = 1, Anti-Neutrino = 0
if t1 == 1
    ve = 1/1900;
    delta = dirac_delta;
    delta_m = NSI_delta;
    legend_type = sprintf('$\\mathcal{P}(\\nu_{\\mu} \\rightarrow \\nu_{\\mu})$');
else
    ve = -1/1900;
    delta = -dirac_delta;
    delta_m = -NSI_delta;
    legend_type = sprintf('$\\mathcal{P}(\\bar{\\nu}_{\\mu} \\rightarrow \\bar{\\nu}_{\\mu})$');
end

% Calculate Probability
M_E_Probability_Calculations;

% Find expected number of Neutrinos using Flux Values and Detector
% Efficiency
efficiency = 0.69;
N_Neutrinos = Probability .* n_nu_mu_10 .* efficiency;


check_par{1} = sinsq_2theta13;
check_par{2} = theta23_degree;
check_par{3} = theta12_degree;

check_par{4} = DELTA_m31_sq;
check_par{5} = ve;
check_par{6} = delta;
check_par{7} = delta_m;

check_par{8} = epsilon_et;
check_par{9} = epsilon_ee;
check_par{10} = epsilon_tt;

check_par{11} = distance;

% Message to be shown on the output
if experiment == 1
    check_par{12} = 'Warning! Default Distance 735km';
else
    check_par{12} = 'Warning! Default Distance 810km';
end

waitbar(0.95,wb,'Generating Plot')
plot1=plot(Energy,N_Neutrinos,Plot_Color);
xlim([0.7 8])
xlabel('Energy[GeV]')
ylabel('N(Events)')

% Create legend
set(plot1,'DisplayName','$N(\nu_{\mu} \rightarrow \nu_{e})$');

legend1 = legend('show');
set(legend1,'Interpreter','latex','FontSize',12);

end


