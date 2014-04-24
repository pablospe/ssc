// A matrix from 'ex1'
A = [1250, -25113, -60050, -42647, -23999;
      500, -10068, -24057, -17092,  -9613;
      250,  -5060, -12079,  -8586,  -4826;
     -750,  15101,  36086,  25637,  14420;
      250,  -4963, -11896,  -8438,  -4756];
B = [5; 2; 1; -3; 1];
u = 1;

// Initialization
x0 = [1 ; -2 ; 3 ; -4 ; 5];
t0 = 0;
tf = 10;

// Select system
system = ex1;

clf
err = [];
hh=[ [1:9]*0.001 [1:9]*0.01 ];
//hh=[ [1:9]*0.01 ];
for h=hh
    disp(h);
    
    errors = []; // errors for current 'h'
    
    t=  [t0:h:tf];
    x_a = ltisol(A, B, u, x0, t);
    //plot(t',x_a');
    
    [t, x] = feuler(system, x0, t0, tf, h);
    errors = [errors, global_error(x, x_a)];
    plot(t', x');

    [t, x] = beuler(system, x0, t0, tf, h);
    errors = [errors, global_error(x, x_a)];
    //plot(t', x');
    
    err = [err; errors]; // errors for all 'h'
end
xtitle('', 'time', 'x');

// Error comparison
scf
disp(err)
plot(hh', err);
xtitle('h (integration step) vs error', 'h', 'error');
legend('forward euler', 'backward euler');

// With 'h=0.001' it is posible to get 'err < 0.01'
// Note: try with 'h=0.0013935'  :P
