function [ X1 ] = process_data( data )
%PROCESS_DATA Smooth, normalize, and center data file
%   For MSRC-12 dataset
%For centering you just subtract the mean, and for normalizing we should be taking 
% each value, lets just say x for now, and doing x/(max-min) for each column.
%size(data)
X1 = cell(size(data,1),size(data,2));

% Code for processing data AFTER extract_gestures is called
%  modelData{i}=newFeatureData(prevIndex:n,:)';
for i=1:size(data,2)
  %  i
    X1{i} = data{i}';
    if (size(X1{i},2) < 76) % 80) 
        X1 = X1(1:i-1);
        continue;
    end
    if (size(X1{i},2) == 80)
        X1{i} = X1{i}(:,[1:3 5:7 9:11 13:15 17:19 21:23 25:27 29:31 33:35 37:39 41:43 45:47 49:51 53:55 57:59 61:63 65:67 69:71 73:75 77:79]);
    end
    X1{i}(:,i) = smooth(X1{i}(:,i));  %smooth
   %  X1(:,i) = X1(:,i)/norm(X1(:,i));
  %  X1(:,i) = (X1(:,i) - min(X1(:,i))) / (max(X1(:,i)) - min(X1(:,i)));  % normalize by min-max
  
  X1{i}(:,i) = (X1{i}(:,i)) / mean(X1{i}(:,i));  % normalize by mean ? 
     X1{i}(:,i) = X1{i}(:,i) - mean(X1{i}(:,i));  % center: subtract the mean
      X1{i} = X1{i}';
end

% Code for processing data BEFORE extract_gestures is called 
%{  
for i=1:size(X1,2)
    X1(:,i) = smooth(X1(:,i));  %smooth
   %  X1(:,i) = X1(:,i)/norm(X1(:,i));

  %  X1(:,i) = (X1(:,i) - min(X1(:,i))) / (max(X1(:,i)) - min(X1(:,i)));  % normalize by min-max
    X1(:,i) = (X1(:,i)) / mean(X1(:,i));  % normalize by mean ? 
     X1(:,i) = X1(:,i) - mean(X1(:,i));  % center: subtract the mean
end
%X1 = normc(X1);
%}
end

