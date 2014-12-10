clear;clc;
%% create new folders
mkdir('../data','trainingData')
mkdir('../data','validationData')
mkdir('../data','testData')
%% Parse all data into training,validation,and test data
df=dir('../data');

for i=1:9
    s = sprintf('p0%d', i);
    for di=4:numel(df)
        if strfind(df(di).name, s)
            src = sprintf('../data/%s', df(di).name);
            copyfile(src,'../data/trainingData');
        end
    end
end
    
for i=10:21
    s = sprintf('p%d', i);
    for di=4:numel(df)
        if strfind(df(di).name, s)
            src = sprintf('../data/%s', df(di).name);
            copyfile(src,'../data/trainingData');
        end
    end
end

for i=22:24
    s = sprintf('p%d', i);
    for di=4:numel(df)
        if strfind(df(di).name, s)
            src = sprintf('../data/%s', df(di).name);
            copyfile(src,'../data/validationData');
        end
    end
end
for i=25:30
    s = sprintf('p%d', i);
    for di=4:numel(df)
        if strfind(df(di).name, s)
            src = sprintf('../data/%s', df(di).name);
            dest = sprintf('../data/trainingData/%s', df(di).name);
            copyfile(src,'../data/testData');
        end
    end
end

%% parse training data into gestures
df=dir('../data/trainingData/*.csv');

%G01  lift outstretched arms
g1 = sprintf('_1_p');
g1a = sprintf('_1A_p');
%G02  Duck
g2 = sprintf('_2_p');
g2a = sprintf('_2A_p');
%G03  Push right
g3 = sprintf('_3_p');
g3a = sprintf('_3A_p');
%G04  Goggles
g4 = sprintf('_4_p');
g4a = sprintf('_4A_p');
%G05  Wind It Up
g5 = sprintf('_5_p');
g5a = sprintf('_5A_p');
%G06  Shoot
g6 = sprintf('_6_p');
g6a = sprintf('_6A_p');
%G07  Bow
g7 = sprintf('_7_p');
g7a = sprintf('_7A_p');
%G08  Throw
g8 = sprintf('_8_p');
g8a = sprintf('_8A_p');
%G09  Had Enough
g9 = sprintf('_9_p');
g9a = sprintf('_9A_p');
%G10 Change Weapon
g10 = sprintf('_10_p');
g10a = sprintf('_10A_p');
%G11 Beat both
g11 = sprintf('_11_p');
g11a = sprintf('_11A_p');
%G12 Kick
g12 = sprintf('_12_p');
g12a = sprintf('_12A_p');

for di=1:numel(df)
    %dataName{1,di} = strtok(df(di).name,'.')

    if strfind(df(di).name, g1)
        G01{1,di} = strtok(df(di).name,'.');
    elseif strfind(df(di).name, g1a)
        G01{1,di} = strtok(df(di).name,'.');

    elseif strfind(df(di).name, g2)
        G02{1,di} = strtok(df(di).name,'.');  
    elseif strfind(df(di).name, g2a)
        G02{1,di} = strtok(df(di).name,'.'); 

    elseif strfind(df(di).name, g3)
        G03{1,di} = strtok(df(di).name,'.');
    elseif strfind(df(di).name, g3a)
        G03{1,di} = strtok(df(di).name,'.');

    elseif strfind(df(di).name, g4)
        G04{1,di} = strtok(df(di).name,'.');   
    elseif strfind(df(di).name, g4a)
        G04{1,di} = strtok(df(di).name,'.');   

    elseif strfind(df(di).name, g5)
        G05{1,di} = strtok(df(di).name,'.');   
    elseif strfind(df(di).name, g5a)
        G05{1,di} = strtok(df(di).name,'.');   

    elseif strfind(df(di).name, g6)
        G06{1,di} = strtok(df(di).name,'.');    
    elseif strfind(df(di).name, g6a)
        G06{1,di} = strtok(df(di).name,'.');    

    elseif strfind(df(di).name, g7)
        G07{1,di} = strtok(df(di).name,'.');    
    elseif strfind(df(di).name, g7a)
        G07{1,di} = strtok(df(di).name,'.');    

    elseif strfind(df(di).name, g8)
        G08{1,di} = strtok(df(di).name,'.');    
    elseif strfind(df(di).name, g8a)
        G08{1,di} = strtok(df(di).name,'.');    

    elseif strfind(df(di).name, g9)
        G09{1,di} = strtok(df(di).name,'.');    
    elseif strfind(df(di).name, g9a)
        G09{1,di} = strtok(df(di).name,'.');    

    elseif strfind(df(di).name, g10)
        G10{1,di} = strtok(df(di).name,'.');    
    elseif strfind(df(di).name, g10a)
        G10{1,di} = strtok(df(di).name,'.'); 

    elseif strfind(df(di).name, g11)
        G11{1,di} = strtok(df(di).name,'.');    
    elseif strfind(df(di).name, g11a)
        G11{1,di} = strtok(df(di).name,'.');

    elseif strfind(df(di).name, g12)
        G12{1,di} = strtok(df(di).name,'.');   
    elseif strfind(df(di).name, g12a)
        G12{1,di} = strtok(df(di).name,'.');    
    end

end 

%remove empty cells
G01 = G01(~cellfun(@isempty, G01))
G02 = G02(~cellfun(@isempty, G02))
G03 = G03(~cellfun(@isempty, G03))
G04 = G04(~cellfun(@isempty, G04))
G05 = G05(~cellfun(@isempty, G05))
G06 = G06(~cellfun(@isempty, G06))
G07 = G07(~cellfun(@isempty, G07))
G08 = G08(~cellfun(@isempty, G08))
G09 = G09(~cellfun(@isempty, G09))
G10 = G10(~cellfun(@isempty, G10))
G11 = G11(~cellfun(@isempty, G11))
G12 = G12(~cellfun(@isempty, G12))

    





