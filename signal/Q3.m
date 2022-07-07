clear all 
close all
clc

syms yd(xd)
dy = diff(yd,xd)== -30*yd+20;
con1 = yd(0)==0;
sol = dsolve (dy,con1)

%h(f)=exp(-30*t)*u(t)
fs=100;
dt=1/fs;
stoptime=1;
t= (0:dt:stoptime-dt)';
n=size(t,1);
z1=exp(-30*t).*heaviside(t);
z2=fft(z1)
z=fftshift(z2);
df=fs/n;
f=-fs/2:df:fs/2-df;

figure
plot(f,angle(z));
figure
plot(f,real(z/n));

