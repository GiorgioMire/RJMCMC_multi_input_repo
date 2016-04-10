clear all
u{1}=rand(24000,1);
u{2}=rand(24000,1);
u{3}=rand(24000,1);
y=zeros(24000,1);
for j=3:24000
    y(j)=0.6*u{1}(j)+0.4*u{2}(j)*u{1}(j)-0.3*y(j-1)+0.01*randn();
end