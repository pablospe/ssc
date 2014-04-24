function xk_plus_1 = step_feuler(f, xk, tk, h)
    xk_plus_1 = xk + h*f(xk,tk);
endfunction
