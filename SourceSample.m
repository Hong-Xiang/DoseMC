function [px, py, pz, dx, dy, dz, e] = SourceSample(spx, spy, spz, ssx, ssy, ssz, sdx, sdy, sdz, iso, se, sse)
px = spx + (2*rand()-1)*ssx;
py = spy + (2*rand()-1)*ssy;
pz = spz + (2*rand()-1)*ssz;
dx = sdx;
dy = sdy;
dz = sdz;
if iso == 1
    phi = rand()*2*pi;
    theta = acos(1-2*rand());
    dx = cos(phi)*sin(theta);
    dy = sin(phi)*sin(theta);
    dz = cos(theta);
end
nd = sqrt(dx^2 + dy^2 + dz^2);
dx = dx/nd;
dy = dy/nd;
dz = dz/nd;
e = se + (2*rand()-1)*sse;
end

