function [t,x]=beuler(f,x0,ti,tf,h)
//metodo de Backward Euler con iteracion de Newton
//exec('jacobiant.sci')

t=[ti:h:tf];
x=zeros(length(x0),length(t));
x(:,1)=x0;
k=0
for tk=ti:h:tf-h
  k=k+1;
  x(:,k+1)=step_beuler(f, x(:,k), tk, h);
end

//t=[ti:h:tf];
//x=zeros(length(x0),length(t));
//x(:,1)=x0;
//k=0;
//I=eye(length(x0),length(x0))//matriz identidad
//for tk=ti:h:tf-h
//  k=k+1;
//  //armamos la iteracion de Newton
//  xprev=x(:,k);
//  J=jacobiant(f,xprev,t(k+1));//Jacobiano del Sistema
//  invH=pinv(I-h*J);//inversa del Hessiano
//  x(:,k+1)=xprev-invH*(xprev-h*f(xprev,t(k+1))-x(:,k));//iteracion de Newton
//  l=0;
//  while norm(x(:,k+1)-xprev)>1e-6*(norm(xprev)+1e-3)&l<20
//    l=l+1;
//    xprev=x(:,k+1);
//    J=jacobiant(f,xprev,t(k+1));//Jacobiano del Sistema
//    invH=pinv(I-h*J);//inversa del Hessiano
//    x(:,k+1)=xprev-invH*(xprev-h*f(xprev,t(k+1))-x(:,k));//iteracion de Newton 
//  end  
//end
endfunction


