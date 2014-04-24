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

////
//// 'ex3'
////
//A = [0, 1; -9.01, 0.2];
//B = [0; 1];
//u = 1;
//
//// Initialization
//x0 = [1; -2];
//t0 = 0;
//tf = 25;
//
//// Select system
//system = ex3;


err = [];
//hh=[ [1:9]*0.001 [1:9]*0.01 ];
hh=[ [1:2:9]*0.01 ];
for h=hh
    printf("h = %f\n", h);

    t=  [t0:h:tf];
    x_a = ltisol(A, B, u, x0, t);
    //plot(t',x_a');

    clf
    errors = []; // errors for current 'h'
    for alpha = [0 .1 .2 .24 .249 .25 .251 .26 .3 .5 .8 1]
        printf("\talpha = %f\n", alpha);
        [t, x] = alpha_mixed_euler(system, x0, t0, tf, h);
        errors = [errors, global_error(x, x_a)];
        plot(t',x');
    end

    err = [err; errors]; // errors for all 'h'
end
xtitle('', 'time', 'x');

// Error comparison
scf
disp(err)
//plot(hh', err(:, 1:10));
plot(hh', err);
xtitle('h (integration step) vs error', 'h', 'error');
legend('0', '.1', '.2', '.24', '.249', '.25', '.251', '.26', '.3', '.5', '.8', '1');
