function y=PopDiffWeakInt(A, DE, v, E0) 
    fun1=@(x) PopDiffWeakVect(A, DE, v, E0, x); I1=integral(fun1,0, E0-DE);
    fun1=@(x) PopDiffWeakVect(A, DE, v, E0, x); I2=integral(fun1,E0-DE, E0);
    y=I1+I2; 
end