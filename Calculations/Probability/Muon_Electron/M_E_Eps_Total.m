function [check_par] = M_E_Eps_Total(distance,dirac_delta,NSI_delta,...
    h1,t1,...
    eps_et_nsi,...
    eps_ee_nsi,...
    eps_tt_nsi,...
    delta_m31_input,...
    wb,Plot_Color)

rho=get_density(distance);

epsilon_et = eps_et_nsi;
epsilon_ee = eps_ee_nsi;
epsilon_tt = eps_tt_nsi;
waitbar(0.5,wb,'Making Calculations')

if h1==1
    DELTA_m31_sq = delta_m31_input * 10^-3;
    legend_mass = sprintf('NH');
else
    DELTA_m31_sq = -1*delta_m31_input * 10^-3;
    legend_mass = sprintf('IH');
end


if t1==1
    ve = 1/1900;
    delta=dirac_delta;
    delta_m=NSI_delta;
    legend_type = sprintf('$\\mathcal{P}(\\nu_{\\mu} \\rightarrow \\nu_{e})$');
else
    ve = -1/1900;
    delta=-dirac_delta;
    delta_m=-NSI_delta;
    legend_type = sprintf('$\\mathcal{P}(\\bar{\\nu}_{\\mu} \\rightarrow \\bar{\\nu}_{e})$');
    
end

M_E_Probability_Calculations;

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

waitbar(0.95,wb,'Generating Plot')
plot1=plot(Energy,Probability,Plot_Color);
xlim([0.7 10])
%     ylim([0 1.0])
xlabel('Energy[GeV]')
ylabel('Appearance Probability')

% Create legend
legend_plot = sprintf('%s, %s',legend_type,legend_mass);
set(plot1,'DisplayName',legend_plot);

legend1 = legend('show');
set(legend1,'Interpreter','latex','FontSize',12);

end


