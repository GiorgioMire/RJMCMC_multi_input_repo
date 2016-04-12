function simulateLb(Settings)
global mc
theta=1/(Settings.betaLB);
pd=makedist('Gamma','a',Settings.alphaLB+mc.q,'b',theta);
mc.lambdaB=random(pd);
end
% lambdaA=random(pd);





