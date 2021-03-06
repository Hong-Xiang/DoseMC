N = 1e7;
e0 = 10;
ec = 0.01;
ss = 1;
sa = 0.1;
st = ss + sa;
sr = rand(N,1)*st;
fa = sr<sa;
eps = rand(N,1);
eps = sqrt(eps);

e1 = e0*eps;
e1(fa > 0) = 0;
% e1 = max(e1, ec);
de = e0-e1;
de = mean(de);
[eh, ev] = hist(e1,100);
pe = eh/N;
pes = 1/ss*2*ev/e0^2/10;
plot(ev, pe, ev, pes);