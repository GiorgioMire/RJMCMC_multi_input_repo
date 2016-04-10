function Noise_update(y)
global mc
SE=mc.sigmaE;
SB=mc.sigmaB;
Pk=mc.Pk;
Eq=mc.Eq;
bq=mc.bq;
q=mc.q;
ak=mc.ak;
ycut=y(mc.t_base:mc.t_end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

invC=SE^(-2)*(Eq.')*Eq+SB^(-2)*eye(q);%;
C=inv(invC);
for m=1:q
      bhat=normrnd(bq(m),sqrt(C(m,m)));
%      display('diff')
  %  ahat(m)-ak(m)
    %PosteriorNew
    b=bq;
    b(m)=bhat;
    % PosteriorNew
  epsilon=ycut-ezp(Eq,b,ycut)-ezp(Pk,ak,ycut);
  epsilonOld=ycut-ezp(Eq,bq,ycut)-ezp(Pk,ak,ycut);
  posteriorNew=prod(exp((-epsilon.^2+epsilonOld.^2)/2/SE^2))*mvnpdf(b,zeros(q,1),SB^2*eye(q));
%PosteriorOld

posterior=mvnpdf(bq,zeros(q,1),SB^2*eye(q));

%La proposal secondo me non va compensata a causa della simmetria
%della gaussiana attorno al valor medio

rate=(posteriorNew/posterior);

if (~isfinite(posterior) && ~isfinite(posteriorNew)) || isnan(rate)
    warning('not finite posterior or nan rate')
    rate=1;
end
alpha=min(1,rate);
z=rand();
if z<alpha 
    mc.bq(m)=bhat;
else

end


end
end