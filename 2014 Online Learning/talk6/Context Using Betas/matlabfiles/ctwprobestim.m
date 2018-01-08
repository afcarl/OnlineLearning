function Pweicondarray = ctwprobestim(contextsymbolarray)
% Computes, given the contextsymbolarray, an estimate of the 
% conditional probability-vector of the datasymbol given the past.
% Call: Pweicondarray=ctwprobestim(contextsymbolarray).
% Here contextsymbolarray contains the context-vector, first 
% context-symbol is at position 1, last context-symbol at position 
% depth.


global datac contc depth
global SymCnts TotCnts Beta
global firstatlevelp

% compute path
indexatlevelp(1)=0; 
nodeatlevelp(1)=1;
for d=1:depth
    indexatlevelp(d+1)=indexatlevelp(d)*contc+contextsymbolarray(d)-1;
    nodeatlevelp(d+1)=firstatlevelp(d+1)+indexatlevelp(d+1);
end
lastnode=nodeatlevelp(depth+1);

% compute weighted probabilities, recursively going from leaf to root  
for symbol=1:datac
    Pweicond=SymCnts(lastnode,symbol)/TotCnts(lastnode);
    for d=depth-1:-1:0
        nodeatd=nodeatlevelp(d+1);
        Pestcond=SymCnts(nodeatd,symbol)/TotCnts(nodeatd);
        betaatd=Beta(nodeatd);
        Pweicond=(betaatd*Pestcond+Pweicond)/(betaatd+1);
    end
    Pweicondarray(symbol)=Pweicond;
end






