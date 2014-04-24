
x0 = [1 ; -2 ; 3 ; -4 ; 5];
t0 = 0;
tf = 10;

hmarg = 0.32;
h = [0.1 0.95 1 1.05 2];

clf
for hi = h*hmarg
//    scf
    [t,x] = feuler(ex1, x0, t0, tf, hi);
    plot(t,x);
end


//
// hmarg = 0.32;
//

scf
A = [1250, -25113, -60050, -42647, -23999;
      500, -10068, -24057, -17092,  -9613;
      250,  -5060, -12079,  -8586,  -4826;
     -750,  15101,  36086,  25637,  14420;
      250,  -4963, -11896,  -8438,  -4756];

eig_val = spec(A);

// max distance to the center of the unit circle
[m,pos] = max( abs(eig_val+1) )

// original eigen values
plot(real(eig_val), imag(eig_val), 'b*');

// unit circle (with center in -1)
a = linspace(0, 2*%pi, 100);
plot(cos(a)-1, sin(a));

// modified eigen values
h=0.32;
abs( eig_val*h+1 )
plot(real(eig_val)*h, imag(eig_val)*h, 'r*')

