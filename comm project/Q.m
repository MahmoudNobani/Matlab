clear all 
close all
clc

%part 1
t=0:0.001:2;
MI=0.25;
c=cos(2.*pi.*25.*t);
m=cos(2.*pi.*t);
s=(1+MI.*m).*c;
subplot(3,1,1),plot(t,s,'-'),xlabel('time (in seconds)'),ylabel('S(t)'),title('modulated signal'),grid on;
subplot(3,1,2),plot(t,m,'-'),xlabel('time (in seconds)'),ylabel('m(t)'),title('Message signal'),grid on;
subplot(3,1,3),plot(t,c,'-'),xlabel('time (in seconds)'),ylabel('c(t)'),title('Carrier signal'),grid on;
%part 2
Ienv=abs((1+MI.*m));
figure 
plot(t,Ienv,'-'),xlabel('time (in seconds)'),ylabel('AC.*(1+MI.*m(t))'),title('Demodulated signal produced by an Ideal envelope detector'),grid on;
%part3

for to=0.4:0.01:1
   k=1; z=s(k)*exp(-t/to);
for i=1:length(z)
    if z(i)>=s(i) 
        y(i)=z(i);
        k=k+i;
    else 
        y(i)=s(i);
    end
end


end;

figure
plot(t,y),xlabel('time (in seconds)'),ylabel('Y'),title('Practical envelop'),grid on;



