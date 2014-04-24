function xk_plus_1 = step_beuler(f, xk, tk, h)
    tk_plus_h = tk+h;

    // Armamos la iteracion de Newton
    xprev=xk;
    
    // Jacobiano del Sistema
    J=jacobiant(f,xprev,tk_plus_h);
    
    // Inversa del Hessiano
    I = eye(J);
    invH=pinv(I-h*J);
    
    // Iteracion de Newton
    xk_plus_1=xprev-invH*h*f(xprev,tk_plus_h);

    it=0;
    while norm(xk_plus_1-xprev)>1e-6*(norm(xprev)+1e-3) & it<20
        it = it+1;
        xprev = xk_plus_1;
        
        // Jacobiano del Sistema
        J = jacobiant(f, xprev, tk_plus_h);
        
        // Inversa del Hessiano
        invH = pinv(I-h*J);
        
        // Iteracion de Newton
        xk_plus_1=xprev-invH*(xprev-h*f(xprev,tk_plus_h)-xk);
    end  
endfunction
