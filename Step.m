function [px1, py1, pz1, dx1, dy1, dz1, et, isAbso] = Step(px0, py0, pz0, dx0, dy0, dz0, e, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha)
sigma_a = (sigmaa1*(e-e0)+sigmaa0*(e1-e))/(e1-e0);
sigma_s = (sigmas1*(e-e0)+sigmas0*(e1-e))/(e1-e0);
sigma_t = sigma_a + sigma_s;
meanFreePath = 1/sigma_t;
xi = rand();
nabla = -log(1-xi);
s = nabla * meanFreePath;
sca_ratio = sigma_s/sigma_t;
sca_rand = rand();
px1 = px0 + s * dx0;
py1 = py0 + s * dy0;
pz1 = pz0 + s * dz0;

%Absorb
if(sca_rand > sca_ratio)
    isAbso = 1;
    et = 0;
    dx1 = dx0;
    dy1 = dy0;
    dz1 = dz0;
    return;
else
    isAbso = 0;
end

%Scattering
epsilon = sqrt(rand());
et = e * epsilon;
if epsilon > alpha
    dx1 = dx0;
    dy1 = dy0;
    dz1 = dz0;
else
    g = (g1*(e-e0)+g0*(e1-e))/(e1-e0);
    [ddx, ddy, ddz] = HGGenerator(g);
    [dx1, dy1, dz1] = RotationUp2Z(dx0, dy0, dz0, ddx, ddy, ddz);
end
end

