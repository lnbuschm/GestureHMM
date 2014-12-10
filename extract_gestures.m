function [ modelData , gestureNum ] = extract_gestures( newFeatureData, Y)
%EXTRACT_GESTURES converts a file of raw features and an accompanying
%tagstream file into a cell matrix separated into gesture instances
%  For MSRC-12 dataset 
    
    i=1;
    prevIndex = 1;
    %sum each column of the Y matrix to find how many instances of the
    % gesture is in the data
    S = sum(Y);
    [numInstances gestureNum] = max(S);

 % disp('cell size');
 % numInstances
 % disp('gesture num');
 % gestureNum
    
  modelData = cell(1,numInstances);
   
    for n = 1:(length(Y(:,gestureNum))-1)  %Y(:,gestureNum)
        if (Y(n,gestureNum)==1) 
          %  i
        %    prevIndex
        %    n
            modelData{i}=newFeatureData(prevIndex:n,:)';
            prevIndex = n;
            i = i + 1;
        end
    end
end

