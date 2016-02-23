N = 10000;
hx = 5;
hy = 5; 
hz = 5; 
nx = 45;
ny = 45;
nz = 45;
e0 = 0.01;
e1 = 10.01;
sigmaa0 = 0.1;
sigmaa1 = 0.1;
sigmas0 = 1;
sigmas1 = 1;
g0 = 0;
g1 = 0;
alpha = 1;
px0 = 0;
py0 = 0;
pz0 = 0;
ssx = 0;
ssy = 0;
ssz = 0;
dx0 = 1;
dy0 = 0;
dz0 = 0;
isISO = 0;
se = 10; 
e = se;
sse = 0;
ecut = 0.01;

der = 0;
for i = 1 : N
[px1, py1, pz1, dx1, dy1, dz1, et, isAbso] = Step(px0, py0, pz0, dx0, dy0, dz0, e, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha);
if (et < ecut) 
    et = ecut;
end
der = der + et;
end
der = der/N