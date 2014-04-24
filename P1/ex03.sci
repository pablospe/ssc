// ex3
clf
k = 1;
b = 1;
m = 1;
A = [0 1; k/m -b/m];

B = [0; 1/m];
u = 1;

x0 = [0; 0];

t = [0: 0.05: 10];
x=ltisol(A,B,u,x0,t);
plot(t,x);
legend('x', 'v');
