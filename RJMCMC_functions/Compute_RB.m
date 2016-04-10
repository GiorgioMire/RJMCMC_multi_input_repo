function [rb,New_bq]=Compute_RB(y,mc,New)
Pk=mc.Pk;
Eq=mc.Eq;
k=mc.k;
q=mc.q;
bq=mc.bq;
SB=mc.sigmaB;
SE=mc.sigmaE;
lambdaB=mc.lambdaB;

ycut=y(mc.t_base:mc.t_end);
Slack=(ycut-ezp(Pk,mc.ak,ycut));

if New.q==0
invC=SE^(-2)*(Eq.')*Eq+SB^(-2)*eye(q);
mu=SE^(-2)*invC\(Eq.'*Slack);
New_bq=0;
f1=SB^(-(New.q-q));
f2=sqrt(abs(invC));
f3=1/(lambdaB^q/factorial(q));
f4=exp(-0.5*mu.'*invC*mu);
rb=f1*f2*f3*f4;



elseif q==0
invCNew=SE^(-2)*(New.Eq.')*New.Eq+SB^(-2)*eye(New.q);
Cnew=inv(invCNew);
muNew=SE^(-2)*Cnew*New.Eq.'*Slack;

New_bq=muNew;

f1=SB^(-(New.q-q));
f2=sqrt(abs(det(Cnew)));
f3=((lambdaB^New.q/factorial(New.q))/(lambdaB^k/factorial(q)));
f4=exp(0.5*muNew.'*invCNew*muNew);
rb=f1*f2*f3*f4;
else

invC=SE^(-2)*(Eq.')*Eq+SB^(-2)*eye(q);
invCNew=SE^(-2)*(New.Eq.')*New.Eq+SB^(-2)*eye(New.q);
mu=SE^(-2)*invC\(Eq.'*Slack);
muNew=SE^(-2)*invCNew\(New.Eq.'*Slack);
New_bq=muNew;
f1=SB^(-(New.q-q));
f2=sqrt(abs(det(invC)/det(invCNew)));
f3=((lambdaB^New.q/factorial(New.q))/(lambdaB^q/factorial(q)));
f4=exp(0.5*muNew.'*invCNew*muNew-0.5*mu.'*invC*mu);
rb=f1*f2*f3*f4;

if isnan(New_bq)
    error('e')
end

end

