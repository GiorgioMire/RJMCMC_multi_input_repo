clear all
close all
N=10000;
for j=1:12
u{j}=randn(N,1);
end
for t=3:N
    y(t,1)=u{1}(t-1)+u{7}(t-1)*u{12}(t-1)+0.01*randn();
end
rjmcmc(y,u)