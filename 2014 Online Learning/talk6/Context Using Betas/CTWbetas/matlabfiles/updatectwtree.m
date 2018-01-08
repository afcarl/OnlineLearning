function Pweicond=updatectwtree(contextsymbolarray,datasymbol)
% Updates the context tree given the contextsymbolarray and the
% observed datasymbol, and computes an estimate of the conditional 
% probability of the datasymbol given the past.
% Call: Pweicond=updatectwtree(contextsymbolarray,datasymbol).
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

% update betas and update counts, first at level depth
Pweicond=SymCnts(lastnode,datasymbol)/TotCnts(lastnode);
SymCnts(lastnode,datasymbol)=SymCnts(lastnode,datasymbol)+1;
TotCnts(lastnode)=TotCnts(lastnode)+1;
% now at smaller levels
for d=depth-1:-1:0
    nodeatd=nodeatlevelp(d+1);
    Pestcond=SymCnts(nodeatd,datasymbol)/TotCnts(nodeatd);
    SymCnts(nodeatd,datasymbol)=SymCnts(nodeatd,datasymbol)+1;
    TotCnts(nodeatd)=TotCnts(nodeatd)+1;
    betaatd=Beta(nodeatd);
    if betaatd> 10000 betaatd=010000; end
    if betaatd<0.0001 betaatd=0.0001; end
    Beta(nodeatd)=betaatd*Pestcond/Pweicond;
    Pweicond=(betaatd*Pestcond+Pweicond)/(betaatd+1);
end

