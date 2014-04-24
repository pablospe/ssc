function err = global_error(x, x_a)
    err = norm(x - x_a)/norm(x_a);
endfunction
