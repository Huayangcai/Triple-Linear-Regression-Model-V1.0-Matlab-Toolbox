function [alpha,beta,gamma,Z_0,aint1,aint2,bint1,bint2] = MLR(y,x)
% multiple linear regression
% Reference:
% Contact: Huayang Cai (E-mail: caihy7@mail.sysu.edu.cn); 
% Z(t)=Z_0+alpha*Q(t)+beta*Z_down(t)+gamma*Z_up(t)
% Calculate  regression coefficients alpha,beta,gamma,Z_0
%
%the output:  
%a   regression coefficients, consisting of alpha,beta,gamma
%b   regression coefficient
%yout   predictand, y-yout is the residual 
%aint1  the 95% confidence interval for a (lower)
%aint2  the 95% confidence interval for a (upper)
%bint1  the 95% confidence interval for b (lower)
%bint2  the 95% confidence interval for b (upper)
%
%the input:
%y   the input signal 
%x   potential predictors 


nobs=length(y);
siz=size(y);
if siz(1)<2
    y=y';
end
siz=size(x);
    xnn=zeros(nobs,siz(2)+1,'double');
    xnn=[x,ones(nobs,1)];
    [coef,coefint]=regress(y,xnn,0.05);
    yout=xnn*coef;
    a=coef(1:siz(2));Z_0=coef(end);
    alpha=a(1);beta=a(2);gamma=a(3);
    aint1=coefint(1:siz(2),1);  aint2=coefint(1:siz(2),2);
    bint1=coefint(end,1);  bint2=coefint(end,2);
end
