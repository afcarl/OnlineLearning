function [symbol,pacond] = sourceoutput

global state

if     state==0 thr = 0.5;   % Pr{X(t)=1|...,X(t-2)=0,X(t-1)=0)
elseif state==1 thr = 0.3;   % Pr{X(t)=1|...,X(t-2)=1,X(t-1)=0)
elseif state==2 thr = 0.1;   % Pr{X(t)=1|...,X(t-2)=0,X(t-1)=1)
else            thr = 0.1;   % Pr{X(t)=1|...,X(t-2)=1,X(t-1)=1)
end;

dummy=rand;
dummy=rand;

if   rand<thr symbol=2; pacond = thr;
else          symbol=1; pacond = (1.0-thr);
end;                                    % actual conditional probability computation

state = floor(state/2) + (symbol-1)*2;      % new state
