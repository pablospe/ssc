function [dx, y, A, B, u] = ex3(x, t)
    A = [     0,   1;
          -9.01, 0.2];
          
    B = [0; 1];
    u = 1;
    
    dx = A*x;
    y = [1 1]*x + 2*u;
endfunction
