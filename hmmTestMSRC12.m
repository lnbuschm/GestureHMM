% TODO:  Need code to create arrays for training, validation, and test data
%    need to create a model for each gesture
%   modelData needs to be converted to an array
%   model needs to be converted to an array

%if you want to compile data from the data folder, uncomment this line and
%the other dataName line.

%df=dir('../data/trainingData/*.csv');
%{
 %}
%open('trainingGestureData.mat');
importData('trainingGestureData.mat','trainingData');
importData('validationGestureData.mat','validationData');
importData('testGestureData.mat','testData');

featureset = 1;  %  0 = velocity and angles,  1 = absolute positions
numActiveModels = 12;
%csvInputFilesPerModel = 10 % 

%dataName = {'P1_1_10_p06','P1_1_10_p19'}; %,'P1_1_10_p21','P1_1_11_p06','P1_1_11_p19','P1_1_11_p21','P1_1_12A_p06','P1_1_12A_p21','P1_1_12_p06','P1_1_12_p19','P1_1_12_p21','P1_1_1A_p06','P1_1_1A_p19','P1_1_1A_p21','P1_1_1_p06','P1_1_1_p19','P1_1_1_p21','P1_1_2A_p06','P1_1_2A_p19','P1_1_2A_p21','P1_1_2_p06','P1_1_2_p19','P1_1_2_p21','P1_1_3A_p06','P1_1_3A_p19','P1_1_3A_p21','P1_1_3_p06','P1_1_3_p19','P1_1_3_p21','P1_1_4_p06','P1_1_4_p19','P1_1_4_p21','P1_1_5_p06','P1_1_5_p19','P1_1_5_p21','P1_1_6A_p06','P1_1_6A_p19','P1_1_6A_p21','P1_1_6_p06','P1_1_6_p19','P1_1_6_p21','P1_1_7A_p06','P1_1_7A_p19','P1_1_7A_p21','P1_1_7_p06','P1_1_7_p19','P1_1_7_p21','P1_1_8A_p06','P1_1_8A_p19','P1_1_8A_p21','P1_1_8_p06','P1_1_8_p19','P1_1_8_p21','P1_1_9A_p06','P1_1_9A_p19','P1_1_9A_p21','P1_1_9_p06','P1_1_9_p19','P1_1_9_p21','P1_2_10A_p04','P1_2_10A_p20','P1_2_10_p04','P1_2_10_p08','P1_2_10_p16','P1_2_10_p20','P1_2_11A_p04','P1_2_11A_p08','P1_2_11A_p16','P1_2_11A_p20','P1_2_11_p04','P1_2_11_p08','P1_2_11_p16','P1_2_11_p20','P1_2_12A_p04','P1_2_12A_p08','P1_2_12A_p16','P1_2_12A_p20','P1_2_12_p04','P1_2_12_p08','P1_2_12_p16','P1_2_12_p20','P1_2_1_p04','P1_2_1_p08','P1_2_1_p16','P1_2_1_p20','P1_2_2_p04','P1_2_2_p08','P1_2_2_p16','P1_2_2_p20','P1_2_3A_p04','P1_2_3A_p08','P1_2_3A_p16','P1_2_3A_p20','P1_2_3_p04','P1_2_3_p08','P1_2_3_p16','P1_2_3_p20','P1_2_4A_p04','P1_2_4A_p08','P1_2_4A_p16','P1_2_4A_p20','P1_2_4_p04','P1_2_4_p08','P1_2_4_p16','P1_2_4_p20','P1_2_5A_p04','P1_2_5A_p08','P1_2_5A_p16','P1_2_5A_p20','P1_2_5_p04','P1_2_5_p08','P1_2_5_p16','P1_2_5_p20','P1_2_6A_p04','P1_2_6A_p08','P1_2_6A_p16','P1_2_6A_p20','P1_2_6_p04','P1_2_6_p08','P1_2_6_p16','P1_2_6_p20','P1_2_7_p04','P1_2_7_p08','P1_2_7_p16','P1_2_7_p20','P1_2_8_p04','P1_2_8_p08','P1_2_8_p16','P1_2_8_p20','P1_2_9A_p04','P1_2_9A_p08','P1_2_9A_p16','P1_2_9A_p20','P1_2_9_p04','P1_2_9_p08','P1_2_9_p16','P1_2_9_p20','P2_1_10_p03','P2_1_10_p07','P2_1_10_p12','P2_1_10_p18','P2_1_11A_p03','P2_1_11A_p07','P2_1_11A_p12','P2_1_11A_p18','P2_1_11_p03','P2_1_11_p07','P2_1_11_p12','P2_1_12_p03','P2_1_12_p07','P2_1_12_p12','P2_1_12_p18','P2_1_1A_p03','P2_1_1A_p07','P2_1_1A_p12','P2_1_1A_p18','P2_1_1_p03','P2_1_1_p07','P2_1_1_p12','P2_1_1_p18','P2_1_2A_p03','P2_1_2A_p07','P2_1_2A_p12','P2_1_2A_p18','P2_1_2_p03','P2_1_2_p07','P2_1_2_p12','P2_1_2_p18','P2_1_3A_p03','P2_1_3A_p07','P2_1_3A_p12','P2_1_3A_p18','P2_1_3_p03','P2_1_3_p07','P2_1_3_p12','P2_1_3_p18','P2_1_4_p03','P2_1_4_p07','P2_1_4_p12','P2_1_4_p18','P2_1_5A_p03','P2_1_5A_p07','P2_1_5A_p12','P2_1_5A_p18','P2_1_5_p03','P2_1_5_p07','P2_1_5_p12','P2_1_5_p18','P2_1_6_p03','P2_1_6_p07','P2_1_6_p12','P2_1_7A_p03','P2_1_7A_p07','P2_1_7A_p12','P2_1_7A_p18','P2_1_7_p03','P2_1_7_p07','P2_1_7_p12','P2_1_7_p18','P2_1_8A_p03','P2_1_8A_p07','P2_1_8A_p12','P2_1_8A_p18','P2_1_8_p03','P2_1_8_p07','P2_1_8_p12','P2_1_8_p18','P2_1_9A_p03','P2_1_9A_p07','P2_1_9A_p12','P2_1_9A_p18','P2_1_9_p03','P2_1_9_p07','P2_1_9_p12','P2_1_9_p18','P2_2_10A_p05','P2_2_10A_p09','P2_2_10_p05','P2_2_10_p09','P2_2_11A_p05','P2_2_11A_p09','P2_2_11_p05','P2_2_11_p09','P2_2_12A_p05','P2_2_12A_p09','P2_2_12_p05','P2_2_12_p09','P2_2_1_p05','P2_2_1_p09','P2_2_2A_p05','P2_2_2A_p09','P2_2_2_p05','P2_2_2_p09','P2_2_3_p05','P2_2_3_p09','P2_2_4A_p05','P2_2_4A_p09','P2_2_4_p05','P2_2_4_p09','P2_2_5A_p05','P2_2_5_p09','P2_2_6A_p05','P2_2_6A_p09','P2_2_6_p05','P2_2_6_p09','P2_2_7_p05','P2_2_7_p09','P2_2_8A_p05','P2_2_8A_p09','P2_2_8_p05','P2_2_8_p09','P2_2_9_p05','P2_2_9_p09','P3_1_10A_p01','P3_1_10A_p10','P3_1_10A_p13','P3_1_10A_p14','P3_1_10_p01','P3_1_10_p10','P3_1_10_p13','P3_1_10_p14','P3_1_11_p01','P3_1_11_p10','P3_1_11_p13','P3_1_11_p14','P3_1_12_p01','P3_1_12_p10','P3_1_12_p13','P3_1_12_p14','P3_1_1A_p01','P3_1_1A_p10','P3_1_1A_p13','P3_1_1A_p14','P3_1_1_p01','P3_1_1_p10','P3_1_1_p13','P3_1_1_p14','P3_1_2A_p01','P3_1_2A_p10','P3_1_2A_p13','P3_1_2A_p14','P3_1_2_p01','P3_1_2_p10','P3_1_2_p13','P3_1_2_p14','P3_1_3A_p01','P3_1_3A_p10','P3_1_3A_p13','P3_1_3A_p14','P3_1_3_p01','P3_1_3_p10','P3_1_3_p13','P3_1_3_p14','P3_1_4A_p01','P3_1_4A_p10','P3_1_4A_p13','P3_1_4A_p14','P3_1_4_p01','P3_1_4_p10','P3_1_4_p13','P3_1_4_p14','P3_1_5_p01','P3_1_5_p10','P3_1_5_p13','P3_1_5_p14','P3_1_6_p01','P3_1_6_p10','P3_1_6_p13','P3_1_6_p14','P3_1_7A_p01','P3_1_7A_p10','P3_1_7A_p13','P3_1_7A_p14','P3_1_7_p01','P3_1_7_p10','P3_1_7_p13','P3_1_7_p14','P3_1_8A_p01','P3_1_8A_p10','P3_1_8A_p13','P3_1_8A_p14','P3_1_8_p01','P3_1_8_p10','P3_1_8_p13','P3_1_8_p14','P3_1_9A_p01','P3_1_9A_p10','P3_1_9A_p13','P3_1_9A_p14','P3_1_9_p01','P3_1_9_p10','P3_1_9_p13','P3_1_9_p14','P3_2_10A_p02','P3_2_10A_p11','P3_2_10A_p15','P3_2_10A_p17','P3_2_10_p02','P3_2_10_p11','P3_2_10_p15','P3_2_10_p17','P3_2_11A_p02','P3_2_11A_p11','P3_2_11A_p15','P3_2_11A_p17','P3_2_11_p02','P3_2_11_p11','P3_2_11_p15','P3_2_11_p17','P3_2_12A_p02','P3_2_12A_p11','P3_2_12A_p15','P3_2_12A_p17','P3_2_12_p02','P3_2_12_p11','P3_2_12_p15','P3_2_12_p17','P3_2_1A_p02','P3_2_1A_p11','P3_2_1A_p15','P3_2_1A_p17','P3_2_1_p02','P3_2_1_p11','P3_2_1_p15','P3_2_1_p17','P3_2_2_p02','P3_2_2_p11','P3_2_2_p15','P3_2_2_p17','P3_2_3_p02','P3_2_3_p11','P3_2_3_p15','P3_2_3_p17','P3_2_4A_p02','P3_2_4A_p11','P3_2_4A_p15','P3_2_4A_p17','P3_2_4_p02','P3_2_4_p11','P3_2_4_p15','P3_2_4_p17','P3_2_5A_p02','P3_2_5A_p11','P3_2_5A_p15','P3_2_5A_p17','P3_2_5_p02','P3_2_5_p11','P3_2_5_p15','P3_2_5_p17','P3_2_6A_p02','P3_2_6A_p11','P3_2_6A_p15','P3_2_6A_p17','P3_2_6_p02','P3_2_6_p11','P3_2_6_p15','P3_2_6_p17','P3_2_7A_p02','P3_2_7A_p11','P3_2_7A_p15','P3_2_7A_p17','P3_2_7_p02','P3_2_7_p11','P3_2_7_p15','P3_2_7_p17','P3_2_8_p02','P3_2_8_p11','P3_2_8_p15','P3_2_8_p17','P3_2_9_p02','P3_2_9_p11','P3_2_9_p15','P3_2_9_p17'};
model = cell(1,size(trainingData,1));
modelData = cell(1, size(trainingData,1));  % , 10);
%for i=1:size(dataName,2)


for i=1:numActiveModels %size(trainingData{5});   % train i models
    clear data;
    modelData = cell(1,size(trainingData{i},2));
    for j=1:size(trainingData{i},2) %1:10  % using j csv files
        %dataName{1,i} = strtok(df(i).name,'.')

        disp(['Processing sequence ',trainingData{i}{j}]);
        [X,Y,tagset,Time]=load_file(trainingData{i}{j});
        if (featureset == 0)
           [ newFeatureData ] = extract_features( X, Time );
           [ modelData{j} ] = extract_gestures( newFeatureData , Y);
        else
            if (featureset == 1)
                [ modelData{j} ] = extract_gestures( X , Y);
            end
        end
        
      %     X = process_data( X );
 %       
        [ modelData{j} ] = process_data( modelData{j}  );
    %    abc = process_data( modelData{j}  );
    end
    modelData = modelData'; %modelData{i}';% ; modelData{1}{2}' ;  modelData{1}{3}'  ];
 %   size(modelData,2)
    
    datasize = 0;
    for n=1: size(modelData,1)
     %   size(modelData{n})
        for m=1: size(modelData{n},2)
            datasize = datasize + 1;
        end
    end
    
    currentIndex = 1;
    data = cell(1,datasize);

    for n=1: size(modelData,1)
     %   size(modelData{n})
        for m=1: size(modelData{n},2)
            data{currentIndex} = cell2mat(modelData{n}(m));
            currentIndex = currentIndex + 1;
        end
    end
    % create HMM model
    %
    setSeed(0); 
    % DATA MATRIX MUST BE POSITIVE DEFINITE
    %data = [modelData'];
    %d = 13; 
    data = data';
    % TODO:  hmmFit doesn't seem to work with nStates (number of hidden states) 
    %             set to a value other than 2 ????
   % model{i} = hmmFit(modelData, 2, 'student', 'verbose', true);
%        model{i} = hmmFit(modelData, 4, 'gauss', 'verbose', true, 'nRandomRestarts', 2, 'maxIter', 1);
       model{i} = hmmFit(data, 5, 'gauss', 'verbose', true, 'nRandomRestarts', 2, 'maxIter', 8);
 %   model{i} = hmmFit(data, 6, 'student', 'verbose', true);

end
%  to test another dataset on this model,
%  logp = hmmLogprob(model, Xtilde);

% try P1_1_8_p19   --  same gesture as 'P3_2_8_p29';
%     P1_1_8_p21   --  same gesture as 'P3_2_8_p29';
%     P1_1_11_p22  -- different person, different gestre
%dataName = [dataName; 'P1_1_8_p19'];


%results = cell(1,12);


for i=1:12 %size(validationData{5});
    modelData = cell(1,size(testData{i},2));
    for j=1:size(testData{i},2)
        disp(['Validation testing sequence: ',testData{i}{j}]);
        [X,Y,tagset,Time]=load_file(testData{i}{j});
        if (featureset == 0)
        [ newFeatureData ] = extract_features( X, Time );  % old extracted features (velocity)
        [ evaluateData ] = extract_gestures( newFeatureData , Y);
        else
            if (featureset == 1)
                [ evaluateData ] = extract_gestures( X , Y);
            end
        end
         [ evaluateData ] = process_data( evaluateData  ); % new features
            
       
        for k=1:numActiveModels
          %   logp = hmmLogprob(model{i}, evaluateData);
         %  results{i,j}{k} = logp;
         logp = hmmLogprob(model{k}, evaluateData);
         results{i,j}{k} = logp; % hmmLogprob(model, testData);
        end
    end
end

% choose maximum likelihood model

for i=1:12 %size(validationData{5}); % num of gesture models (12)
 %   maxl = -inf;
  %  maxli = -1;
 % disp('SIZE valdatai}');
%  size(validationData{i})
  
  %  disp('SIZE results{i}');
  %  size(results)
    for j=1:size(testData{i},2) %size(results{i},2) %size(validationData{i},2) % side of validation set for each gesture
    %    disp(['ML testing sequence: ',validationData{i}{j}]);
       % if (
     %  size(results{i,j})
       for l=1:size(results{i,j}{1})  % hopefully all of these are the same size
        %   disp('k size');
        %   size(results{i,j}(k))
         maxl = -inf;
            maxli = -1;
           for k=1:numActiveModels %12 % size(results{i}{j},1)
  
               %choose most likely model
            %   results{k}{j}(l,1)
            % if (results{k}{j}(l,1) >= maxl) % = logp; % hmmLogprob(model, testData);
            %    maxl = results{k}{j}(l,1);
             if (results{i,j}{k}(l,1) >= maxl) % = logp; % hmmLogprob(model, testData);
                maxl = results{i,j}{k}(l,1);
                maxli = k;
             else 
         %        disp('Errr');
          %       results{k}{j}(l,1)
             end
           
           end
           maxLikelihood{i,j}(l,1) = maxli;
           
       end
    end
end
  
% create prediction vectors to save predictions for each gesture (12)
correctPredictions = zeros(12,1); %0;
incorrectPredictions = zeros(12,1);   
% check for percentage accuracy
for i=1:numActiveModels
     for j=1:size(testData{i},2) 
          for l=1:size(results{i,j}{1})
            %  if ( maxLikelihood{i,j}(l,1) == i) correctPredictions = correctPredictions + 1;
           %   else incorrectPredictions = incorrectPredictions+1;
             if ( maxLikelihood{i,j}(l,1) == i) correctPredictions(i) = correctPredictions(i) + 1;
              else incorrectPredictions(i) = incorrectPredictions(i)+1;
              end
          end
     end
end

%disp('Correct predictions');
%correctPredictions
%disp('Incorrect predictions');
%incorrectPredictions
gestureAccuracy = correctPredictions ./ (correctPredictions + incorrectPredictions)
totalAccuracy = sum(correctPredictions) / (sum(correctPredictions) + sum(incorrectPredictions))
% TODO:  Need code to create arrays for training, validation, and test data

%results = cell(1,numel(df));


%{
dataName, 'P1_1_8_p19', 'P1_1_8_p21', 'P1_1_11_p28', 'P3_2_8_p29'};

    disp(['Testing sequence: ',dataName{i}]);
    [X,Y,tagset,Time]=load_file(dataName{i});
    [ newFeatureData ] = extract_features( X, Time );

    [ testData ] = extract_gestures( newFeatureData , Y);
    logp = hmmLogprob(model, testData)
    results{i} = logp; % hmmLogprob(model, testData);
    
end
%}
% TODO: need code to find maximum likelihood from results array


% after obtaining logp of each test set, we choose the HMM with highest
% logp ?  


% try doing k-means of 1 and running a naive bayes? 





%{
dataName =  'P1_1_8_p19';
disp(['Testing sequence ',dataName,'same gesture as P3_2_8_p29' ]);
[X,Y,tagset,Time]=load_file(dataName);
[ newFeatureData ] = extract_features( X, Time );

[ testData ] = extract_gestures( newFeatureData , Y);
logp = hmmLogprob(model, testData)



dataName =  'P1_1_8_p21';
disp(['Testing sequence ',dataName,'same gesture as P3_2_8_p29' ]);
[X,Y,tagset,Time]=load_file(dataName);
[ newFeatureData ] = extract_features( X, Time );

[ testData ] = extract_gestures( newFeatureData , Y);
logp = hmmLogprob(model, testData)



dataName = 'P1_1_11_p28'; %  'P1_1_11_p22';
disp(['Testing sequence ',dataName,'same gesture as P3_2_8_p29' ]);
[X,Y,tagset,Time]=load_file(dataName);
[ newFeatureData ] = extract_features( X, Time );

[ testData ] = extract_gestures( newFeatureData , Y);
logp = hmmLogprob(model, testData)
%}


%for n = 1:length(dataName)
%   disp(['Testing sequence ',dataName(n)]);
  %  [X,Y,tagset,Time]=load_file(dataName);
 %[ newFeatureData ] = extract_features( X, Time );

% [ modelData ] = extract_gestures( newFeatureData , Y);
%end
