function y = LTA(nn, Om, k1, k2, v)
    if (v<0.01*Om*k1)
        Res=pi*Om^2/sqrt(1+2*Om^2/k1^2);
    else
        if (Om<sqrt(v/nn))||(Om<k1/(3*sqrt(nn)))
            Res=pi*Om^2;
        else
            if k1<0.3*v/(Om*sqrt(nn))
                Res=2*v*(1-exp(-pi*Om^2/(2*v)));
            else
                tmin=-nn/sqrt(v); tmax=nn/sqrt(v)+log(nn)/k1;
                RI = LTI(tmin, tmax, Om, k1, k2, v);
                Res = RI.res;
            end
        end
    end
    %disp(Res);
    y=Res;
end
