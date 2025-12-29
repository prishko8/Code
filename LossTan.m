function y=LossTan(Om, k, v, nn)
% This program calculates the loss tangent at given maximum Rabi frequency
% Om, maximum relaxation rate k (decoherence rate is set to k/2) and the
% maximum field sweep rate v. nn=100 determines the border line of 
% integration domain. Setting nn=100 gives fast and reasonable calculation
% rate. The TLS dipole moment is set identical for all resonant TLSs and
% equal to one. The accuracy is set to 1%. 
% The result is expected to be the universal function of the dimensionless
% parameters Om^2/v and Om/k. Therefore in case of some marginal values of
% parameters it could make sense to rescale to something closer to one to
% simplify the calculations. 
% The outcome gives the loss tangent divided by the maximum loss tangent given
% by the linear response theory. 
t=integral2(@(x,y)IntThis(x,y,Om,k,v,nn),0,1,0,1,'RelTol',1e-2);
y=3*t/(pi*Om^2); 
end 