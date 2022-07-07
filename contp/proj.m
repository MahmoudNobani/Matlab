%1
K=-74;
[a,b,c,d]=linmod('CA1180729');
[num,den]=ss2tf(a,b,c,d);
closedloop_TF=tf(num,den);
%2
z=step(closedloop_TF,'b');
plot(z);
grid on;
%3
stepinfo(closedloop_TF);
s = tf('s');
Gtf = 1272/(s^3+101.7.*s^2+171.*s);
kp=dcgain(Gtf);
step_error = 1 / (1+kp)
kv=dcgain(s.*Gtf);
ramp_error = 1 / (kv)
ka=dcgain(s.*s.*Gtf);
par_error = 1 / (ka)
%5
sstf = ss(closedloop_TF);
%7
%rlocus(closedloop_TF);
grid on

