function [check_par] = M_M_Range_Eps_tt(distance,dirac_delta,NSI_delta,...
    h1,t1,...
    eps_et_nsi,...
    eps_ee_nsi,...
    eps_tt_min,eps_tt_max,eps_tt_inc,wb)

rho=get_density(distance);


ii = 1;

epsilon_et = eps_et_nsi;
epsilon_ee = eps_ee_nsi;
epsilon_tt = eps_tt_max;
eps_decrement=eps_tt_inc;

waitbar(0.5,wb,'Making Calculations')

while(epsilon_tt >= (eps_tt_min-0.05))
    
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
    
    
    M_M_Probability_Calculations;
    
    check_par{1} = sinsq_2theta13;
    check_par{2} = theta23_degree;
    check_par{3} = theta12_degree;
    
    check_par{4} = DELTA_m31_sq;
    check_par{5} = ve;
    check_par{6} = delta;
    check_par{7} = delta_m;
    
    check_par{8} = epsilon_et;
    check_par{9} = epsilon_ee;
    check_par{10} = 'N/A';
    
    check_par{11} = distance;
    
    % Message to be shown on the output
    check_par{12} = ' ';
    
    ymatrix(ii,:)=Probability;
 
    eps_tt_legend{ii} = sprintf('\\epsilon_{\\tau\\tau} = %2.1f', epsilon_tt);
    ii = ii+1;
    epsilon_tt = epsilon_tt - eps_decrement;
    
end

  

    waitbar(0.95,wb,'Generating Plot')
    plot1=plot(Energy,ymatrix);
    xlim([0.4 8])
%     ylim([0 1.0])
    xlabel('Energy[GeV]')
    ylabel('Appearance Probability')
   
    % Create legend
for kk=1:length(eps_tt_legend)
    set(plot1(kk),'DisplayName',eps_tt_legend{kk});
end

    legend1 = legend('show');

end


