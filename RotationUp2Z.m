function [dx1, dy1, dz1] = RotationUp2Z(dx0, dy0, dz0, ddx, ddy, ddz)
up = dx0*dx0 + dy0*dy0;
if (up<1)     
    ux = [dx0, dy0, -up/dz0];
else
    ux = [0, 0, sign(dx0)];
end
    uz = [dx0, dy0, dz0];
    ux = ux/norm(ux);
    uy = cross(uz,ux);
    d1 = ddx*ux + ddy*uy + ddz*uz;
    dx1 = d1(1); dy1 = d1(2); dz1 = d1(3);

end

