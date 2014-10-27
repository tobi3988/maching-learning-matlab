for i = (1:3)
    a = a + i;
end

x = (0: 0.1: 10);
y = sin(x);
plot(x,y);

hold all
plot(x, sin(x + (pi/4)));

N = 100; M = 2; 
A = rand(N,M);
A = A - repmat(mean(A), N, 1);
A = A ./ repmat(std(A), N ,1);




normalDistribution = normrnd(0, 0.1, s, 1);
t = sin(x);