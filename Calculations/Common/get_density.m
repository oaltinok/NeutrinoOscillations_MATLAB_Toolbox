function [rho] = get_density(truel)
% This function calculates the density for the corresponding distance

pathl=[500, 1500, 3500, 10600, 11200, 12800];
rhol=[2.3, 3.2, 3.35, 5.0, 6.3, 8.6];

for i=2:6
    
if((truel >= pathl(i-1)) && (truel <= pathl(i)))
    path_dif=pathl(i)-pathl(i-1);
    rho_dif=rhol(i)-rhol(i-1);
    scale_factor = (truel-pathl(i-1)) / path_dif;
    avg_rho=rhol(i-1)+scale_factor*rho_dif;
end

end

% Scale the density by dividing with 2.72
rho=avg_rho/2.72;




