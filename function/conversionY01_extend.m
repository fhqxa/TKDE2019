function [ output_args ] = conversionY01_extend( Y, numCol )
    gnd = Y;
    ClassLabel = unique(Y); %Count the number of labels
    nClass = length(ClassLabel);    
    [nSmp,~] = size(Y);
    Y = eye(nClass,nClass);
    Z = zeros(nSmp,numCol);
    for i=1:nClass
        idx = find(gnd==ClassLabel(i));
        Z(idx,1:nClass) = repmat(Y(i,1:nClass),length(idx),1);
    end    
    output_args= Z;
end

