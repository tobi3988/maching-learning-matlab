function [] = features()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
rawData = csvread('training.csv');
%index which feature you want to select
featureIndex = 14;
% sort rows by select feature (It is not really necessary)
sortedByFeature = sortrows(rawData,featureIndex);
% select column
feature = sortedByFeature(:,[featureIndex]);
%select column of delay
delaySortedByFeature = sortedByFeature(:,[15]);
%plot it
scatter(feature, delaySortedByFeature, '*')
end

