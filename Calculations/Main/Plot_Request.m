function [check_par] = Plot_Request(...
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
% New Variable Naming
% epsilon_ee = eps(1)
% epsilon_et = eps(2)
% epsilon_tt = eps(3)

% Create eps array
    eps = zeros(1,3);
    
    distance = handles.distance;
    
    for i = 1:3
        eps(i) = handles.eps_nsi(i);
    end

    Plot_Color = handles.Plot_Color{handles.color_indice};
    
%% Create and Empty Cell Array for Labels
labels = cell(1,5);
check_par = cell(1,12);

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
[DELTA_m31_sq, labels] = setMassHierarchy(handles.h1,DELTA_m31_sq,labels);

% Particle Type:  Neutrino = 1, Anti-Neutrino = 0
[ve, delta, delta_m, labels] = setType(...
    handles.t1,...
    handles.dirac_delta,...
    handles.NSI_delta,...
    labels);


%% Calculate the Probability
if handles.isRange == 1
    
    ii = 1;
    
    eps(handles.rangeEps) = handles.eps_max(handles.rangeEps);
    
    while (eps(handles.rangeEps) >= (handles.eps_min(handles.rangeEps)-0.05))
        
        M_E_Probability_Calculations;
        
        yMatrix(ii,:) = Probability;
        
        labels{5}{ii} = sprintf('\\epsilon_{ee} = %2.1f', eps(handles.rangeEps));
        
        ii = ii + 1;
        
        eps(handles.rangeEps) = eps(handles.rangeEps) - handles.eps_inc(handles.rangeEps);
        
    end
    
else

M_E_Probability_Calculations;

end


%% Fill check_par variable
check_par = setCheckPar(...
    check_par,...
    sinsq_2theta13,...
    theta23_degree,...
    theta12_degree,...
    DELTA_m31_sq,...
    ve,...
    delta,...
    delta_m,...
    distance,...
    handles);

% % Final Settings
[yVector, check_par, labels ] = setFinalSettings(...
    check_par,...
    handles,...
    Probability,...
    labels);

% Update waitbar
waitbar(0.95,wb,'Generating Plot')


if handles.isRange == 1
    plotRange(Energy,yMatrix, labels);
else
    plotSingle(Energy, yVector, Plot_Color, labels);
end

end


function plotRange(xVector,yMatrix, labels)
    
    colormap('Jet')
    plot1=plot(xVector,yMatrix);
    xlim([0.4 8])
    %     ylim([0 1.0])
    xlabel('Energy[GeV]')
    ylabel(labels{1,3})
    
   
    % Create legend
    for kk=1:length(labels{5})
        set(plot1(kk),'DisplayName',labels{5}{kk});
    end
    
    legend1 = legend('show');

end


function plotSingle(xVector, yVector, Plot_Color, labels)

    plot1 = plot(xVector,yVector,Plot_Color);
    xlim([0.7 10])
    xlabel('Energy[GeV]')
    ylabel(labels{1,3})
    
    % Create legend with using User Input
    legend_plot = sprintf('%s, %s',labels{1,2}, labels{1,1});
    set(plot1,'DisplayName',legend_plot);
    
    legend1 = legend('show');
    set(legend1,'Interpreter','latex','FontSize',12);
    
end


function check_par = setCheckPar(...
    check_par,...
    sinsq_2theta13,...
    theta23_degree,...
    theta12_degree,...
    DELTA_m31_sq,...
    ve,...
    delta,...
    delta_m,...
    distance,...
    handles)


check_par{1} = sinsq_2theta13;
check_par{2} = theta23_degree;
check_par{3} = theta12_degree;

check_par{4} = DELTA_m31_sq;
check_par{5} = ve;
check_par{6} = delta;
check_par{7} = delta_m;

check_par{8} = handles.eps_nsi(1);
check_par{9} = handles.eps_nsi(2);
check_par{10} = handles.eps_nsi(3);

check_par{11} = distance;

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


function [DELTA_m31_sq, labels] = setMassHierarchy(...
    h,...
    DELTA_m31_sq,...
    labels)

% Mass Hierarchy: Normal = 1, Inverted = 0
if h == 1
    labels{1,1} = sprintf('NH');
else
    DELTA_m31_sq = -1 * DELTA_m31_sq;
    labels{1,1} = sprintf('IH');
end

end


function [ve, delta, delta_m, labels] = setType(...
    t,...
    dirac_delta,...
    NSI_delta,...
    labels)

% Particle Type:  Neutrino = 1, Anti-Neutrino = 0
if t == 1
    ve = 1/1900;
    delta = dirac_delta;
    delta_m = NSI_delta;
    labels{1,2} = sprintf('$\\mathcal{P}(\\nu_{\\mu} \\rightarrow \\nu_{\\mu})$');
else
    ve = -1/1900;
    delta = -1 * dirac_delta;
    delta_m = -1 * NSI_delta;
    labels{1,2} = sprintf('$\\mathcal{P}(\\bar{\\nu}_{\\mu} \\rightarrow \\bar{\\nu}_{\\mu})$');
end

end

function [yVector, check_par, labels ] = setFinalSettings(...
    check_par,...
    handles,...
    Probability,...
    labels)
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
    
    % Set y-axis Label
    labels{1,3} = 'Event Rate';
    
else
    
    if handles.isRange == 1
        
        % Set Check Paramaters GUI Variable for Ranging epsilon
        check_par{7 + handles.rangeEps} = 'N/A';
        
        labels{1,3} = 'Appearance Probability';
        
        % If there is a range yVector must be returned as empty;
        yVector = zeros(1,10);
        
    else
        
        check_par{12} = ' '; % Message to be shown on the output
        
        % Set yVector for Probability
        yVector = Probability;
        
        % Set y-axis Label
        labels{1,3} = 'Appearance Probability';
        
    end
end

end



