function initctwprobestim(datacard,contcard,treedepth)
% Initializes the context-tree. Parameters are datacardinality, 
% contextcardinality and treedepth. 
% Call: initctwprobestim(datacard,contcard,treedepth).

global datac contc depth
global SymCnts TotCnts Beta
global firstatlevelp

datac=datacard;
contc=contcard;
depth=treedepth;

firstatlevelp(1)=1; % note that level 0 is denoted by 1 
for d=0:depth-1
    nodesatleveld=contc^d;
    firstatlevelp(d+2)=firstatlevelp(d+1)+nodesatleveld;
end
numberofnodes=(contc^(depth+1)-1)/(contc-1);
numberofbetanodes=(contc^(depth)-1)/(contc-1);

SymCnts=ones(numberofnodes,datac)/2;
TotCnts=ones(numberofnodes,1)*datac/2;
Beta=ones(numberofbetanodes,1);


