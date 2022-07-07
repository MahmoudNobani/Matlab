clear all 
close all
clc

syms ti toe
h= 10.*exp(0.2.*(ti-toe)).*(heaviside(ti-toe)-heaviside(ti-toe-2));
x= 10.*exp(-0.2.*toe).*(heaviside(toe-5)-heaviside(toe-9));
y=int(x*h,toe,-inf,inf)

fplot(matlabFunction(y),[0 12]),grid on, xlabel('toe'), ylabel('x conv h'), title('convolution');




