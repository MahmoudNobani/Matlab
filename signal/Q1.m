clear all 
close all
clc
%part a
t1=-10:0.01:10; %time for x1
x1=stp_fn(t1+3)-stp_fn(t1-4); %code for x1
plot(t1,x1),grid on,xlabel('t'), ylabel('u(t+3)- u(t-4)'), title('X1'); % the ploting of x1

%part c
t2=0:0.01:16;   %time for x2
x2=stp_fn(t2-4)+rmp_fn(t2-4)-2*rmp_fn(t2-7)+rmp_fn(t2-13); %code for x2
figure
plot(t2,x2),grid on,xlabel('t'), ylabel('u(t-4) +r(t-4)-2r(t-7) +r(t-13)'), title('X2'); % the ploting of x2

%part b
%plotting finite pulse tran
t=-5:.01:5;   %Time vector 
w = 2; %pulse width
d= -3:3:10; %delay vector
y=pulstran(t,d,'rectpuls',w); 
figure
plot(t,y),grid on,xlabel('t'), ylabel('pulse((t-3n)/2)'), title('finite pulse'); 

