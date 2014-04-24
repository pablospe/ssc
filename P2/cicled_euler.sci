function [t,x] = cicled_euler(f, x0, ti, tf, h)
    t=[ti:h:tf];
    x=zeros(length(x0),length(t));
    x(:,1)=x0;
    k=0
    for tk=ti:h:tf-h
        k = k+1;
        
        if( modulo(k,2) )
            x(:,k+1) = step_feuler(f, x(:,k), tk, h);
        else
            x(:,k+1) = step_beuler(f, x(:,k), tk, h);
        end
    end
endfunction
