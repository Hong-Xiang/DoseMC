NTests = 1000;
MaxErr = 1e-7;
for i = 1 : NTests
    cost = 2*rand()-1;
    phi = rand()*2*pi;
    sint = sqrt(1-cost^2);
    ddx = sint*cos(phi);
    ddy = sint*sin(phi);
    ddz = cost;
    
    dx0 = rand();
    dy0 = rand();
    dz0 = rand();
    r = dx0^2 + dy0^2 + dz0^2;
    dx0 = dx0/sqrt(r); dy0 = dy0/sqrt(r); dz0 = dz0/sqrt(r);
    
    [dx1, dy1, dz1] = RotationUp2Z(dx0, dy0, dz0, ddx, ddy, ddz);
    costc = dx0*dx1 + dy0*dy1 + dz0*dz1;
    assert(abs(cost-costc)<MaxErr);
end