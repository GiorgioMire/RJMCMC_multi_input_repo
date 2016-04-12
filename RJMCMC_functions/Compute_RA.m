function [ra,New_ak]=Compute_RA(y,mc,New)
Pk=mc.Pk;
Eq=mc.Eq;
k=mc.k;
q=mc.q;
bq=mc.bq;
sigmaA=mc.sigmaA;
sigmaEP=mc.sigmaE;
lambdaA=mc.lambdaA;
New_k=New.k;
New_Pk=New.Pk;
ycut=y(mc.t_base:mc.t_end);
if New_k==0
invC=sigmaEP^(-2)*Pk.'*Pk+sigmaA^(-2)*eye(k);
%invCNew=sigmaEP^(-2)*(New_Pk.')*New_Pk+sigmaA^(-2)*eye(New_k);
C=inv(invC);

Slack=(ycut-ezp(Eq,bq,ycut));
mu=sigmaEP^(-2)*C*Pk.'*Slack;


New_ak=0;

f1=sigmaA^(-(New_k-k));
f2=sqrt(abs(1/det(C)));
f3=((lambdaA^New_k/factorial(New_k))/(lambdaA^k/factorial(k)));
f4=exp(-0.5*mu.'*invC*mu);
ra=f1*f2*f3*f4;



elseif k==0

invCNew=sigmaEP^(-2)*(New_Pk.')*New_Pk+sigmaA^(-2)*eye(New_k);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Eq,bq,ycut));

muNew=sigmaEP^(-2)*Cnew*New_Pk.'*Slack;

New_ak=muNew;

f1=sigmaA^(-(New_k-k));
f2=sqrt(abs(det(Cnew)));
f3=((lambdaA^New_k/factorial(New_k))/(lambdaA^k/factorial(k)));
f4=exp(0.5*muNew.'*invCNew*muNew);
ra=f1*f2*f3*f4;
else

invC=sigmaEP^(-2)*Pk.'*Pk+sigmaA^(-2)*eye(k);
invCNew=sigmaEP^(-2)*(New_Pk.')*New_Pk+sigmaA^(-2)*eye(New_k);
C=inv(invC);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Eq,bq,ycut));
mu=sigmaEP^(-2)*C*Pk.'*Slack;
muNew=sigmaEP^(-2)*Cnew*New_Pk.'*Slack;

New_ak=muNew;

f1=sigmaA^(-(New_k-k));
f2=sqrt(abs(det(Cnew)/det(C)));
f3=((lambdaA^New_k/factorial(New_k))/(lambdaA^k/factorial(k)));
f4=exp(0.5*muNew.'*invCNew*muNew-0.5*mu.'*invC*mu);
ra=f1*f2*f3*f4;






end

