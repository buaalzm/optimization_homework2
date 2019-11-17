function grad = g_(x)
    grad(1) = 10*x(1)-9*x(2)+4;
    grad(2) = 10*x(2)-9*x(1)-15;
end