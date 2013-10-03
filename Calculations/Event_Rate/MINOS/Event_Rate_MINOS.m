function [check_par] = Event_Rate_MINOS(dirac_delta,NSI_delta,...
    h1,t1,...
    eps_et_nsi,...
    eps_ee_nsi,...
    eps_tt_nsi,...
    wb,Plot_Color)

waitbar(0.2,wb,'Reading Flux Files')

Read_Flux_Files_Neutrinos;

distance = 735;
rho=get_density(distance);


epsilon_et = eps_et_nsi;
epsilon_ee = eps_ee_nsi;
epsilon_tt = eps_tt_nsi;

waitbar(0.5,wb,'Making Calculations')

if h1==1
    DELTA_m31_sq = 2.35e-3;
else
    DELTA_m31_sq = -2.35e-3;
end

if t1==1
    ve = 1/1900;
    delta=dirac_delta;
    delta_m=NSI_delta;
else
    ve = -1/1900;
    delta=-dirac_delta;
    delta_m=-NSI_delta;
    
end

Calculations_Flux;

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
check_par{12} = 'Warning! Default Distance 735km';

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


