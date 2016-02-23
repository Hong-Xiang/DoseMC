function phi = Simulation(NRun, spx, spy, spz, ssx, ssy, ssz, sdx, sdy, sdz, iso, se, sse, hx, hy, hz, nx, ny, nz, ecut, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha)
    phi = zeros(nx, ny, nz);
    cdx = 2*hx/nx;
    cdy = 2*hy/ny;
    cdz = 2*hz/nz;
    for iRun = 1 : NRun
        [px, py, pz, dx, dy, dz, e] = SourceSample(spx, spy, spz, ssx, ssy, ssz, sdx, sdy, sdz, iso, se, sse);
        isAbso = 0;
        while (abs(px) <= hx && abs(py) <= hy && abs(pz) <= hz && isAbso ==0 && e > ecut)
            [px, py, pz, dx, dy, dz, et] = Step(px, py, pz, dx, dy, dz, e, e0, e1, sigmaa0, sigmaa1, sigmas0, sigmas1, g0, g1, alpha);
            ix = ceil((px+hx)/cdx);
            iy = ceil((py+hy)/cdy);
            iz = ceil((pz+hz)/cdz);  
            if(ix < 1 || ix > nx || iy < 1 || iy > ny || iz < 1 || iz > nz)
                break;
            end
            if(et < ecut)
                de = e - ecut;
            else
                de = e - et;
            end
            phi(ix, iy, iz) = phi(ix, iy, iz) + de;
            e = et;            
        end
    end
end

