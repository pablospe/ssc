// ex1
clf
A = -9.8;
B = 1;
u = 1;
x0 = 0;

t = [0: 0.01: 1];
//x = (1-exp(-9.8*t))/9.8
x=ltisol(A,B,u,x0,t);
plot(t,x);
