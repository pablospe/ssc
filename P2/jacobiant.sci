function J=jacobiant(f1,x,t)
 //estimates the Jacobian df/dx evaluated at (x,t) 
  n=length(x);
  J=zeros(n,n);
  fx=f1(x,t);
  for i=1:n
    x1=x;
    dx=0.00001*x1(i)+1e-10;
    x1(i)=x1(i)+dx;
    J(:,i)=(f1(x1,t)-fx)/dx;
  end
endfunction  
  
