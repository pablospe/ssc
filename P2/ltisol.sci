function x=ltisol(A, B, u, x0, t)
    n = length(x0); // order
    r = length(t);  // number of points in time
        
    x = zeros(n,r);
    x(:,1) = x0;
    
    Ainv = inv(A);
    for k=2:r
        expm_A_t_k = expm(A*t(k));
        x(:,k) = expm_A_t_k*x0 + Ainv*(expm_A_t_k-eye(n,n)) * B * u;
    end
endfunction
