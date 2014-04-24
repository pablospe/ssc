function [t,x]=feuler(f, x0, ti,  tf,h)
//La función feuler integra el sistema dx/dt=f(x,t) entre ti y tf 
//con un paso de integración h, a partir de la c.i. x(ti)=x0,
//utilizando el método de Forward Euler. La función f debe contener la cadena
//con el nombre de la función.
t=[ti:h:tf];
x=zeros(length(x0),length(t));
x(:,1)=x0;
k=0
for tk=ti:h:tf-h
  k=k+1;
  x(:,k+1)=step_feuler(f, x(:,k), tk, h);
//  x(:,k+1)=x(:,k)+h*f(x(:,k),tk);
end
endfunction
