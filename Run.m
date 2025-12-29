v_i = 0.000001;
v_f = 1000;
v_vals = linspace(v_i,v_f,10^6);

results = zeros(size(v_vals));
for i = 1:length(v_vals)
    v_current = v_vals(i);
    results(i) = LossTan(3,9,v_current,100);
end

fig = figure('Visible','off');

plot(v_vals,results);
title('Nonequilibrium Loss Tangent as a Function of Bias Sweep Rate');
xlabel('v');
ylabel('tan(\delta)/tan(\delta_{max})');

saveas(fig,'LossTan_MATLAB.png');
close(fig);