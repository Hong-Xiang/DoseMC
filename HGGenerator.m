function [ddx, ddy, ddz] = HGGenerator(g)
g2 = g*g;
beta = rand();
mingerr = 1e-5;
if (g<mingerr && g > -mingerr)
    cost = 2*beta-1;
else
    tmp = ((1-g2)/(1+2*g*beta-g));
    tmp = tmp*tmp;
    cost = 1/(2*g)*(1+g2-tmp);
end
cost = max(cost, -1);
cost = min(cost, 1);
sint = sqrt(1-cost*cost);
phiv = rand()*2*pi;
ddx = sint*cos(phiv);
ddy = sint*sin(phiv);
ddz = cost;
end

