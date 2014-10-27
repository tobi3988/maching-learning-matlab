%% Example Title
% Summary of example objective
x = (1:0.01:3)';
y = sin(x) + normrnd(0, 0.1, size(x,1), 1);
plot(x, y, '*');

hold all;
X = [ones(size(x)) x x.^2];

w3 = lsqlin(X, y, [], []);
y_hat3 = w3(1) + w3(2).*x + w3(3).*x.^2;
plot(x, y_hat3, 'red');



%% Section 1 Title
% Description of first code block
a=1;

%% Section 2 Title
% Description of second code block
a=2;
