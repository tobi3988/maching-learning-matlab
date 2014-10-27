%Linear Regression Project

%Read load training set
train = csvread('training.csv');

%Create Vector with analyzed variable
x = train(:, 11);

%Change values if necessary
%x = log2(x);
%x = x-40;

%Create Vector with performance of processor
y = train(:, 15);

%Assemple vectors to n*2 Matrix
X = [x,y];

%Create matrix with average of all performance data respecting to
%expressions of analysed variable
u=unique(X(:,1));
b=zeros(length(u),2);
b(:,1)=u;
for idx=1:length(u)
     b(idx,2)=mean(X(X(:,1)==u(idx),2));
end
%Print expressions of analysed variable
x = b(:,1)
y = b(:,2);

%Plot
scatter(x,y,'red','filled')
