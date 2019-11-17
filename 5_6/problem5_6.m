clear;
for point_index = 1:4
    x0 = [[0,0];
          [-0.4,0];
          [10,0];
          [11,0]];

    G = [10, -9;
         -9, 10];

    f_min = -22;
    x = x0(point_index,:)'; 
    for i = 1:100
        g = g_(x(:,i))';
        f(i) = (10*x(1,i)^2-18*x(1,i)*x(2,i)+10*x(2,i)^2)/2+4*x(1,i)-15*x(2,i)+13;
        
        if i>=2
            convergenceFactor(i-1) = (f(i)-f_min)/(f(i-1)-f_min);
        end
        
        if abs(f(i) - f_min)<0.0001
            break;
        end
        x(:,i+1) = x(:,i)-(g'*g)/(g'*G*g)*g;        
    end

    disp(max(convergenceFactor));
    if point_index~=4
        clear;
    end
end