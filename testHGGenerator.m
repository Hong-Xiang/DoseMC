NTest = 1e6;
Result = zeros(NTest, 1);
g = 0.9;
for i = 1 : NTest
    [dx, dy, Result(i)] = HGGenerator(g);
end
[h, v] = hist(Result, 100);
h = h / sum(h);
p = HG(g, v);
p = p/sum(p);
plot(v, p, v, h);