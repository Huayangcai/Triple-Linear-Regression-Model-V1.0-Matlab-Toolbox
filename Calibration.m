function  Calibration(wt,Z,n)
if n==1 
m=min(Z); M=max(Z);
xx=m:(M-m)/2:M;
plot(Z,wt,'s',...
'MarkerEdgeColor','b','MarkerFaceColor','none')
hold on
plot(xx,xx,'--k')
axis tight
else
m=min(Z); M=max(Z);
xx=m:(M-m)/2:M;
plot(Z,wt,'o',...
'MarkerEdgeColor','r','MarkerFaceColor','none')
hold on
plot(xx,xx,'--k')
axis tight
end
end
