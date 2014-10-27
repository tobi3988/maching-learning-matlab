%Linear Regression Project

%Read load training set
set = csvread('training.csv');
numberOfFolds = 5;
validationSize = floor(size(set,1)/numberOfFolds);
%validation = set(1:1:validationSize, :);
%train = set(validationSize+1:1:end, :);

%create 3 dimensional Array with a size of numberOfFolds in the 3th
%dimension
buckets = datasample(set,validationSize,'Replace',false);
for bucketIndex = drange(2:numberOfFolds)
    buckets(:,:,bucketIndex) = datasample(set,validationSize,'Replace',false);
end

% Do the valdiation numberOfFolds times and add up the summedSquares
averagedSummedSquares = 0;
for bucketIndex = drange(1:numberOfFolds)
    % getting the validation set out of the 3d Array
    validationSet = buckets(:,:,bucketIndex);
    % take concat the rest of the buckets to the training set.
    trainingSet = 0; % preallocate correctly (if it gets slow)
    for trainingIndex = drange(1:(numberOfFolds-1))
        %make sure the validation index is left out
        calculatedIndex = mod((bucketIndex + trainingIndex -1),(numberOfFolds)) + 1; 
        if(trainingSet == 0)
            trainingSet = buckets(:,:,trainingIndex);
        else
            trainingSet = [trainingSet; buckets(:,:,trainingIndex)];
        end
    end
    
    y = trainingSet(:,15);
    yv = validationSet(:, 15);
    
    %feature selection
    order1 = trainingSet(:, [1 6 7 14]);
    % second order (x²)
    order2 = (order1.*order1);
    % third order (x³)
    order3 = (order1.*order2);
    % concat orders
    X = [order1 order2 order3];
    
    order1v = validationSet(:, [1 6 7 14]);
    order2v = (order1v.*order1v);
    order3v = (order2v.*order1v);
    Xv = [order1v order2v order3v];
    
    %regression
    b = inv(X'*X)*X'*y;
    result = Xv*b;
    
    %Print errors if necessary
    sol = yv - result;
    %calucated summed Squares (probably wrong => lets check it together)
    averagedSummedSquares = averagedSummedSquares + sum(sol .* sol)./length(sol);
end
averagedSummedSquares./folds
%axis = [1:1:validationSize];
%plot(axis,result,'color','red')
%hold all;
%plot(axis,yv,'color','blue')
