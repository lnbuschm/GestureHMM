function [ newFeatureData ] = extract_features( X, Time )
%EXTRACT_FEATURES Extracts velocity and relative angle features from the
%   given data file name 
%   For MSRC-12 dataset

    T=size(X,1);	% Length of sequence in frames
    newFeatureData = zeros(T-1,76);  %  76 features,  T instances

    % SKELETON indices start at 0
    %NUI_SKELETON_POSITION_SHOULDER_LEFT = 4;
    %NUI_SKELETON_POSITION_ELBOW_LEFT = 5;
    %NUI_SKELETON_POSITION_WRIST_LEFT = 6;

    %NUI_SKELETON_POSITION_SHOULDER_RIGHT = 8;
    %NUI_SKELETON_POSITION_ELBOW_RIGHT = 9;
    %NUI_SKELETON_POSITION_WRIST_RIGHT = 10;

    %NUI_SKELETON_POSITION_HIP_LEFT = 12;
    %NUI_SKELETON_POSITION_KNEE_LEFT = 13;
    %NUI_SKELETON_POSITION_ANKLE_LEFT = 14;

    %NUI_SKELETON_POSITION_HIP_RIGHT = 16;  
    %NUI_SKELETON_POSITION_KNEE_RIGHT = 17;
    %NUI_SKELETON_POSITION_ANKLE_RIGHT = 18;

    x1Col = 1;
    x1Col2 = 61;
    for i = 2:length(X(:,:))  % row / instance #
       for j = 1:length(X(1,:))  % column / feature #
         if (mod((j),4) == 0) 
             continue;
         end

         if (x1Col <= 60) 
             %  velocity = change in position / change in time
             newFeatureData(i-1,x1Col) = abs(X(i-1,j) - X(i,j)) / (Time(i)-Time(i-1)) * 1000000000;
         end

         if ((j-1)==(4*4) || (j-1)==(4*8) || (j-1)==(4*12) || (j-1)==(4*16) ) % %NUI_SKELETON_POSITION_SHOULDER_LEFT = 4;
             % X coordinate : X(i,j)  =  parent joint to X(i,j+4)
             % Y coordinate : X(i,j+1)  =  parent joint to X(i,j+5)
             % Z coordinate : X(i,j+2)  =  parent joint to X(i,j+6)

             %  [azimuth,elevation,r] = cart2sph(X,Y,Z)
             % for each pair of coordinates:   child - parent
             [azimuth,elevation,r] = cart2sph(X(i,j+4)-X(i,j), X(i,j+5)-X(i,j+1), X(i,j+6)-X(i,j+2));
             x1Col2 = 61 + ((j-1)/16 * 4 - 4);

              newFeatureData(i-1,x1Col2) = azimuth;
              newFeatureData(i-1,x1Col2+1) = elevation;

             [azimuth,elevation,r] = cart2sph(X(i,j+8)-X(i,j+4), X(i,j+9)-X(i,j+5), X(i,j+10)-X(i,j+6));

             newFeatureData(i-1,x1Col2+2) = azimuth;
              newFeatureData(i-1,x1Col2+3) = elevation;

         end
         x1Col = x1Col + 1;
       end
       x1Col=1;
    end
end

