N = 1e6;
hx = 10;
hy = 10; 
hz = 10; 
nx = 25;
ny = 25;
nz = 25;
e0 = 0.01;
e1 = 10.1;
sigmaa0 = 0.1;
sigmaa1 = 0.1;
sigmas0 = 0.1;
sigmas1 = 0.1;
g0 = 0;
g1 = 0;
alpha = 1;
xtmp = -p.hx + p.hx/p.nx : p.hx*2/p.nx : p.hx - p.hx/p.nx;
% nx = numel(xtmp);
vp0 = xtmp(ceil(nx/3));
    vp1 = xtmp(ceil(nx/2));
spx = vp0; spy = vp1; spz = vp1;
% spx = 0;
% spy = 0;
% spz = 0;
ssx = 0;
ssy = 0;
ssz = 0;
sdx = 1;
sdy = 0;
sdz = 0;
isISO = 0;
se = 10; 
sse = 0;
ecut = 1;
phi = RunMC_mex(N, hx, hy, hz, ecut, nx, ny, nz, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha, spx, spy, spz, ssx, ssy, ssz, sdx, sdy, sdz, isISO, se, sse);
x = 1 :nx;
subplot(121), plot(x, n3D21D(phi));
subplot(122), contour(n3D22D(phi));