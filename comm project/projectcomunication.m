clc;clear all;
mu=.25;
Ac=1;
fm=1;
fc=25;
t = 0:0.001:2;
tau=0.4;

s = Ac*(1+mu*cos(2*pi*fm*t)).*cos(fc*2*pi*t);
v0=s(1);

plot(t,s)
 
 axis([0 2 -2 2]);
 
title('Modulated signal S(t)');
xlabel('Time in seconds');
ylabel('S(t)');
grid on
figure;
% hold on


v =abs( Ac*(1+mu*cos(2*pi*fm*t)));
plot(t,v)

hold on
axis([0 2 -2 2]);
title('Perfect Outpot signal from envelope detector');
xlabel('Time in seconds');
ylabel('Y(t)');
grid on
figure;
% hold on

aa=findpeaks(s,t);      %find the peaks of the modulated signal
out=zeros(1,length(t)); %practical oytpot of demodulated signal
x=0;           %time shift

%find the best tau
taut=0.04:0.001:1;       %tau matrix for testing
sum=0;
D=zeros(1,length(taut)); %mean square error matrix

for k=1:length(taut)     %go threw the each value of tau between 0.04 and 1 and each step is 0.001 and store the value of mean square error in D array
for i=1:length(t)
     if(ismember(s(i),aa)&&s(i)>=v0*exp((-t(i)+x)/taut(k)))%if we are at the peak of s(t)
        v0=s(i);        
         x=t(i);
        
     end
     %the output signal equals the maximum between s(t) and V0*e^(-t+x/tau)    
    if(s(i)>=v0*exp((-t(i)+x)/taut(k)))
    out(i)=s(i);
    else
        out(i)=v0*exp((-t(i)+x)/taut(k));
    end
    sum=sum+((v(i)-out(i))^2)/length(taut);
end

D(k)=sum; % store the value of mean square error in the corresponding index in D array
% Resetting the values for the next loop

v0=0;
x=0;
sum=0;
end

 plot(taut,D,'r');      %plot D verses 1/fs:1/fm
 axis([0.04 1 -2 2]);
 title('The Mean Square Error');
 xlabel('Tau');
 ylabel('D(t)');
 figure;
cc = min(D)   %find the lowest point in the D array ;cc is the lowest value of error 
index = find(D==cc)    % find the index of cc in the D array
tau=taut(index)             %find and set the value of tau that corresponds to the lowest error



%plotting the practical output with the smallest mean square error


for i=1:length(t)
    if(ismember(s(i),aa)&&v0*exp((-t(i)+x)/tau)<=s(i))%if we are at the peak of s(t) and s(t) is bigger than Vout
        v0=s(i);  
        x=t(i);
              
    end         
    %the output signal equals the maximum between s(t) and V0*e^(-t+x/tau)    
    if(s(i)>=v0*exp((-t(i)+x)/tau))
    out(i)=s(i);
    else
        out(i)=v0*exp((-t(i)+x)/tau);
    end
end   

 plot(t,out,'g');
 axis([0 2 -2 2]);
 title('Practical Output Demodulated signal Y1(t)');
 xlabel('Time in seconds');
 ylabel('Y1(t)');

