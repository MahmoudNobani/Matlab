clear all 
close all
clc

t=-0.02:pi/1000000:0.02;

y1=sin(200*pi*t);
y2=cos(500*pi*t); 

y3=y1.*y2;
subplot(2,1,1),plot(t,y1,'-'),grid on, xlabel('t'), ylabel('sin(200*pi*t)'), title('y1');
subplot(2,1,2),plot(t,y2,'-'),grid on, xlabel('t'), ylabel('cos(500*pi*t)'), title('y2');
figure 
plot(t,y3,'-'),grid on,xlabel('t'), ylabel('cos(500*pi*t)*sin(200*pi*t)'), title('y3');