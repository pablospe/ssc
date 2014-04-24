A = [0, 1; -9.01, 0.2];
B = [0; 1];
u = 1;

x0 = [1; -2];
t0 = 0;
tf = 25;

// Select system
system = ex3;

clf
err = [];
//hh=[ [1:9]*0.001 [1:9]*0.01 ];
hh=[ [1:9]*0.01 ];
for h=hh
    disp(h);
    
    errors = []; // errors for current 'h'
    
    t=  [t0:h:tf];
    x_a = ltisol(A, B, u, x0, t);
    //plot(t',x_a');
    
    [t, x] = feuler(system, x0, t0, tf, h);
    errors = [errors, global_error(x, x_a)];
    //plot(t', x');

    [t, x] = beuler(system, x0, t0, tf, h);
    errors = [errors, global_error(x, x_a)];
    //plot(t', x');

    [t, x] = mixed_euler(system, x0, t0, tf, h);
    errors = [errors, global_error(x, x_a)];
    //plot(t',x');
    
    [t, x] = cicled_euler(system, x0, t0, tf, h);
    errors = [errors, global_error(x, x_a)];
    plot(t', x');
    
    err = [err; errors]; // errors for all 'h'
end
xtitle('', 'time', 'x');

// Error comparison
scf
disp(err)
plot(hh', err);
xtitle('h (integration step) vs error', 'h', 'error');
legend('forward euler', 'backward euler', 'mixed euler', 'cicled euler');
