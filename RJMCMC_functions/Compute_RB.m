function [rb,New_bq]=Compute_RB(y,mc,New)
SE=mc.sigmaE;
ak=mc.ak;
bq=mc.bq;
Pk=mc.Pk;
Eq=mc.Eq;
SB=mc.sigmaB;
q=mc.q;
ycut=y(mc.t_base:mc.t_end);
if New.q==0
invC=SE^(-2)*Eq.'*Eq+SB^(-2)*eye(q);
%invCNew=SE^(-2)*(New.Eq.')*New.Eq+SB^(-2)*eye(New.q);
C=inv(invC);

Slack=(ycut-ezp(Pk,ak,ycut));
mu=SE^(-2)*invC\(Eq.'*Slack);


New_bq=0;

f1=SB^(-(New.q-q));
f2=sqrt(abs(1/det(C)));
f3=((mc.lambdaB^New.q/factorial(New.q))/(mc.lambdaB^q/factorial(q)));
f4=exp(-0.5*mu.'*invC*mu);
rb=f1*f2*f3*f4;



elseif q==0

invCNew=SE^(-2)*(New.Eq.')*New.Eq+SB^(-2)*eye(New.q);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Pk,ak,ycut));

muNew=SE^(-2)*Cnew*New.Eq.'*Slack;

New_bq=muNew;

f1=SB^(-(New.q-q));
f2=sqrt(abs(det(Cnew)));
f3=((mc.lambdaB^New.q/factorial(New.q))/(mc.lambdaB^q/factorial(q)));
f4=exp(0.5*muNew.'*invCNew*muNew);
rb=f1*f2*f3*f4;
else

invC=SE^(-2)*Eq.'*Eq+SB^(-2)*eye(q);
invCNew=SE^(-2)*(New.Eq.')*New.Eq+SB^(-2)*eye(New.q);
C=inv(invC);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Pk,ak,ycut));
mu=SE^(-2)*C*Eq.'*Slack;
muNew=SE^(-2)*Cnew*New.Eq.'*Slack;

New_bq=muNew;

f1=SB^(-(New.q-q));
f2=sqrt(abs(det(Cnew)/det(C)));
f3=((mc.lambdaB^New.q/factorial(New.q))/(mc.lambdaB^q/factorial(q)));
f4=exp(0.5*muNew.'*invCNew*muNew-0.5*mu.'*invC*mu);
rb=f1*f2*f3*f4;

if isnan(New_bq)
    error('e')
end

end

