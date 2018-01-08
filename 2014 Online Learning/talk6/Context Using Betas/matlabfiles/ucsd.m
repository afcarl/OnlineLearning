clear all;
initsource(1,444); % (very)good=2222, bad=444
initctwprobestim(2,2,4);
figure(1);
pa=1;
for t=1:4
    [symb,pacond]=sourceoutput;
    symbarr(t)=symb;
    pa=pa*pacond;
end
bias=-log(pa);

pw=1;
for t=5:1004  % 14 then 1004
    [symb,pacond]=sourceoutput;
    pa=pa*pacond;
    la(t-4)=-log(pa)-bias;
    symbarr(t)=symb;
    contarr= [symbarr(t-1) symbarr(t-2) symbarr(t-3) symbarr(t-4)];  
    pwcond=updatectwtree(contarr,symb);
    pw=pw*pwcond;
    lw(t-4)=-log(pw);
    bnd(t-4)=5+3/2*log((t-4)/3)/log(2);
    aposarr(t-4)=plotmaxmodel; drawnow
    apos1arr(t-4)=apos1;
    apos011arr(t-4)=apos011;
    apos00111arr(t-4)=apos00111;
end

figure(2);
subplot(2,1,1);
plot(apos1arr,'r'); hold on; axis([0 1000 0 1]); grid on;
plot(apos011arr,'b'); 
plot(apos00111arr,'g'); hold off;
subplot(2,1,2);
plot(aposarr,'k'); axis([0 1000 0 1]); grid on; 

figure(3);
plot(lw-la); hold on; axis([0 1000 -5 20]); grid on;
plot(bnd,'r'); hold off;