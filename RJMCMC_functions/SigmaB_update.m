function SigmaB_update(Settings)
global mc
theta=1/(Settings.betaB+0.5*eaz(norm(mc.bq)^2,1));
pd=makedist('Gamma','a',Settings.alphaB+0.5*mc.q,'b',1/theta);
 mc.sigmaB=sqrt(1/random(pd));
end