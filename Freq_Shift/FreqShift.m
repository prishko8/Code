function y=FreqShift(Om, A, vm, E0, N)
% Integrates frequency shift over angles
% Om-maximum Rabi frequency 10^-6 < Om < 10^-1
% A - proportionality cofficient for 1/T1=AEDelta_0^2, 10^8 s^-1 K^-3=10^(-3) KK^-3, 
% vm maximum energy sweep rate 
% E0-resonance energy, N - number of integration steps
% in integration over angle
AA=FrShftThet1(Om, 1/(2*N):1/N:(1-1/(2*N)), A, vm, E0); 
y=sum(AA)/N; 