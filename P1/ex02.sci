// ex2
clf
ra = 20;
re = 1;
A = [-ra 0; ra -re];

B = [0; 0];
u = 0;

ce = 1;
cs = 0;
x0 = [ce; cs];

t = [0: 0.005: 5];
x=ltisol(A,B,u,x0,t);
plot(t,x);
legend('ce', 'cs');
