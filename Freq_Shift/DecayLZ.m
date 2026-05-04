function y=DecayLZ(E, D0, T1, om0, v)
    y=D0^2*(E*sqrt(E^2-D0^2)/2+D0^2*log((E+sqrt(E^2-D0^2))/(E-sqrt(E^2-D0^2)))/2)/(v*T1*om0^3); 
end