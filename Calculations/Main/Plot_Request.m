function [check_par] = Plot_Request2(...
    handles,...
    wb)
%% Plot_Request()
% Called by GUI buttons to Plot requested result
% isEventRate value is used to select between Probability vs Event Rate
% Calculations
% For the Probability Calculation Function uses:
% 1) Common Constants
% 2) User Inputs from GUI
% 3) Uses finalStateParticle variable to calculate different probabilities
%       finalStateParticle = 1 for Electron (Muon to Electron)
%       finalStateParticle = 0 for Muon (Muon to Muon)
%
% For the Event Calculation Function uses in addition to 
% Probability Calculations:
% 1) Reads Flux Files and sets the distance parameter specific to the Experiment
%       experiment = 1 for MINOS
%       experiment = 0 for NOVA
% 2) Calculates expected number of Neutrinos using Flux Values and Detector
% Efficiency

%% Assign Parameters for Calculations
    distance = handles.distance;
    epsilon_et = handles.eps_et_nsi;
    epsilon_ee = handles.eps_ee_nsi;
    epsilon_tt = handles.eps_tt_nsi;
    Plot_Color = handles.Plot_Color{handles.color_indice};

%% Overwrite Distance if User presses Event Rate
if handles.isEventRate == 1
    distance = getDistance(handles.experiment);
end


%% Initialize Variables
% Load Common Constants
Get_Constants;

% Set Energy Value
Energy = setEnergy(handles);

% Get Density
rho = Get_Density(distance);

% Waitbar
waitbar(0.5,wb,'Making Calculations')

%% Change Variables and Form Legend Strings using the user input
[DELTA_m31_sq, legend_mass] = setMassHierarchy(handles.h1,DELTA_m31_sq);

% Particle Type:  Neutrino = 1, Anti-Neutrino = 0
[ve, delta, delta_m, legend_type] = setType(...
    handles.t1,...
    handles.dirac_delta,...
    handles.NSI_delta);


%% Calculate the Probability
M_E_Probability_Calculations;


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

% Final Settings
[yVector, check_par ] = setFinalSettings(...
    check_par,...
    handles,...
    Probability);

% Update waitbar
waitbar(0.95,wb,'Generating Plot')

%% Plot Probability
plot1 = plot(Energy,yVector,Plot_Color);
xlim([0.7 10])
xlabel('Energy[GeV]')
ylabel(' To be Modified')

% Create legend with using User Input
legend_plot = sprintf('%s, %s',legend_type,legend_mass);
set(plot1,'DisplayName',legend_plot);

legend1 = legend('show');
set(legend1,'Interpreter','latex','FontSize',12);


end

function distance = getDistance(expID)

    % experiment = 1 for MINOS
    % experiment = 0 for NOVA
    if expID == 1
        distance = 735;
    else
        distance = 810;
    end
    
end


function Energy = setEnergy(handles)

if handles.isEventRate == 1
    % experiment = 1 for MINOS
    % experiment = 0 for NOVA
    if handles.experiment == 1
        Energy = handles.Flux_Energy_MINOS;
    else
        Energy = handles.Flux_Energy_NOVA;
    end
else
    % For Probability Energy is ranging from [0,10] GeV
    Energy = linspace(0.4,10,1000);

end

end


function [DELTA_m31_sq, legend_mass] = setMassHierarchy(h,DELTA_m31_sq)

% Mass Hierarchy: Normal = 1, Inverted = 0
if h == 1
    legend_mass = sprintf('NH');
else
    DELTA_m31_sq = -1 * DELTA_m31_sq;
    legend_mass = sprintf('IH');
end

end


function [ve, delta, delta_m, legend_type] = setType(t,dirac_delta,NSI_delta)

% Particle Type:  Neutrino = 1, Anti-Neutrino = 0
if t == 1
    ve = 1/1900;
    delta = dirac_delta;
    delta_m = NSI_delta;
    legend_type = sprintf('$\\mathcal{P}(\\nu_{\\mu} \\rightarrow \\nu_{\\mu})$');
else
    ve = -1/1900;
    delta = -1 * dirac_delta;
    delta_m = -1 * NSI_delta;
    legend_type = sprintf('$\\mathcal{P}(\\bar{\\nu}_{\\mu} \\rightarrow \\bar{\\nu}_{\\mu})$');
end

end

function [yVector, check_par ] = setFinalSettings(...
    check_par,...
    handles,...
    Probability)
%% Sets Final Parameters for Event Rate or Probability

if handles.isEventRate == 1
    
    % Find expected number of Neutrinos using Flux Values and Detector Efficiency
    efficiency = 0.69;
   
    if handles.experiment == 1
        N_Neutrinos = Probability .* handles.n_nu_mu_10_MINOS .* efficiency;
        check_par{12} = 'Warning! Default Distance 735km'; % Message to be shown on the output
    else
        N_Neutrinos = Probability .* handles.n_nu_mu_10_NOVA .* efficiency;
        check_par{12} = 'Warning! Default Distance 810km'; % Message to be shown on the output
    end
 
    % Set yVector for Event Rate
    yVector = N_Neutrinos;
    
else

    check_par{12} = ' '; % Message to be shown on the output
    
    % Set yVector for Probability
    yVector = Probability;
end

end



