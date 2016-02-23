function phi = RunMCSingle(N, hx, hy, hz, ecut, nx, ny, nz, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha, spx, spy, spz, ssx, ssy, ssz, sdx, sdy, sdz, isISO, se, sse)
phi = SimulationSingle(N, spx, spy, spz, ssx, ssy, ssz, sdx, sdy, sdz, isISO, se, sse, hx, hy, hz, nx, ny, nz, ecut, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha);
end