n=1000;
m=500;

L=rand(n,m)-0.5;
L=sign(L)/2+0.5;

S=cumsum(L,1);

plot(S)
hold on;
plot(S(:,m+1:end),'b');

x=[0:n];
y=sqrt(log(m)*x/2);
plot(x,x/2+y,'r',x,x/2-y,'r',x,x/2,'b','LineWidth',2);
%plot(x,x,'b',x,-x,'b','LineWidth',3);
llim=1.5*y(end);
%ylim([-llim,llim+edge*n]);
xlim([0,n]);
hold off;
xlabel('iteration');
ylabel('cumulative loss');


