function [check_par] = M_M_Eps_Total(...
    distance,...
    dirac_delta,...
    NSI_delta,...
    h1,...
    t1,...
    eps_et_nsi,...
    eps_ee_nsi,...
    eps_tt_nsi,...
    wb,...
    Plot_Color)

%% Initialize Variables
% Load Common Constants
Get_Constants;

% Set Energy Range
% Energy is ranging from [0,10] GeV
Energy = linspace(0.4,10,1000);

% Get Density
rho = get_density(distance);

% Assign epsilon values
epsilon_et = eps_et_nsi;
epsilon_ee = eps_ee_nsi;
epsilon_tt = eps_tt_nsi;

% Waitbar
waitbar(0.5,wb,'Making Calculations')

%% Change Variables and Form Legend String using the user input
% Mass Hierarchy: Normal = 1, Inverted = 0
if h1==1
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

%% Calculate the Probability
M_M_Probability_Calculations;

%% Fill check_par variable
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
check_par{12} = ' ';

% Update waitbar
waitbar(0.95,wb,'Generating Plot')

%% Plot Probability
plot1=plot(Energy,Probability,Plot_Color);
xlim([0.7 10])
xlabel('Energy[GeV]')
ylabel('Appearance Probability')

% Create legend with using User Input
legend_plot = sprintf('%s, %s',legend_type,legend_mass);
set(plot1,'DisplayName',legend_plot);

legend1 = legend('show');
set(legend1,'Interpreter','latex','FontSize',12);


end


