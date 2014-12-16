datasize = 0;
size(trainingData)
    for n=1: size(trainingData,1)
    %    size(trainingData{n})
        for m=1: size(trainingData{n},2)
            datasize = datasize + 1;
        end
    end
    datasize