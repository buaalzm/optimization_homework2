syms x;
f1=9*x-4*log(x-7);

G_sym = jacobian(gradient(f1));
g_sym = gradient(f1);

x = [7.4, 7.2, 7.01, 7.8, 7.88, 7.889];
x_save = x;

for pointIndex = 1:5
    for iterTimes = 1:12
        x = x_save(iterTimes,:);
        g = subs(g_sym);
        G = subs(G_sym);
        x_save(iterTimes+1,pointIndex) = x_save(iterTimes,pointIndex)-G(pointIndex)\g(pointIndex);
    end
end

disp(x_save);
