%Calor
%       [T,x] = Calor(Tiz, Td, L, k, Tini,dt,dx,tf)
%
%       Parámetros entrada
%            Tiz = Temepratura a la izquierda
%            Td = Temepratura a la derecha
%            L = longitud en centímetros
%            Tini = Temperatura inicial de la barra 
%            dt = Paso del tiempo 
%            dx = Paso de la distancia
%            tf = Tiempo final
%
%        Parámetros salida
%             T = Matriz con los valores de la temepratura en cada punto
%             x = Matriz con los valores de cada x

function [T,x] = Calor(Tiz, Td, L, k, Tini,dt,dx,tf)
  lam=k*(dt/(dx^2));
  nx=(L/dx)+1;
  T(1,1)=Tiz;
  for i=2:(nx-1);
    T(i,1)=Tini;
  endfor
  T(nx,1)=Td;
  for j=1:(tf/dt);
    T(1,j+1)=Tiz;
    for k=2:(nx-1);
      T(k,j+1)=T(k,j)+(lam*(T(k+1,j)-(2*T(k,j))+T(k-1,j)));
    endfor
    T(nx,j+1)=Td;
  endfor
  for l=1:nx;
    x(l,1)=0+(l*dx)-dx;
  endfor
  endfunction