function [t,x] = alpha_mixed_euler(f, x0, ti, tf, h, alpha)
    t=[ti:h:tf];
    x=zeros(length(x0),length(t));
    x(:,1)=x0;
    k=0
    for tk=ti:h:tf-h
        k = k+1;

        // forward euler
        xf = step_feuler(f, x(:,k), tk, h);

        // backward euler
        xb = step_beuler(f, x(:,k), tk, h);

        // alpha blending
        x(:,k+1) = alpha*xf + (1-alpha)*xb;
    end
endfunction
