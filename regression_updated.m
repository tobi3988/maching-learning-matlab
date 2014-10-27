%%Linear Regression Project

%% Prefix
%Load set
completeSet = csvread('training.csv');


% Select and/or create variables (performance must be the last column)
set = completeSet(:, [1 1 14 1 15]);
set(:,2) = set(:,2).*set(:,2);
set(:,4) = set(:,1).*set(:,3);


% Set number of Columns and number or rows
columns = size(set);
columns = columns(:, 2);
setSize = size(set);
setSize(:,end) = [];

%Set number of folds
folds = 5;
indexes = crossvalind('Kfold', setSize, folds)
solutionvector = zeros(1,folds);

%% Train and test
%Train and test n times
for idx=1:folds
%Create trainings and test fold
trainRows = (indexes == idx);
validationRows = (indexes < idx) | (indexes > idx);
trainfold = set(trainRows,:);
validationfold = set(validationRows,:);

% Separate performance from variables
trainfoldVar = trainfold;
trainfoldVar(:, columns) = [];
trainfoldPerf = trainfold(:, end);
% Train regressor
b = inv(trainfoldVar'*trainfoldVar)*trainfoldVar'*trainfoldPerf;
% Test regressor
% Separate performance from variables
validationfoldVar = validationfold;
validationfoldVar(:, columns) = [];
validationfoldPerf = validationfold(:, end);
% Calculate costs
averageresp = mean(validationfoldPerf);
errors = validationfoldPerf - validationfoldVar * b;
errors = errors.*errors;
dim = size(errors);
dim = dim(:,1);
errors = sum(errors);
errors = errors/dim;
errors = sqrt(errors);
errors = errors/averageresp;
solutionvector(idx) = errors;
end
% Print out averaged costs of cost function
mean(solutionvector)


% Separate performance from variables
train = set;
train(:, columns) = [];
perf = set(:, end);
% Train regressor
b = inv(train'*train)*train'*perf
result = train*b;
% Print
axis = [1:1:setSize];
plot(axis,result,'color','red');
hold all;
plot(axis,perf,'color','blue');

