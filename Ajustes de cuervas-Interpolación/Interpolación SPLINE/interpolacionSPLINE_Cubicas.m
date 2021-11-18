 %interpolacionSPLINE_Cubicas
%       [coeficientes, valor, xValores, yValores] = interpolacionSPLINE_Cubicas(x, y, n ,xi)
%
%       Parámetros entrada
%            x = vector  de dimensión k
%            y = vector de dimensión k
%             n = número de datos
%            xi = valor en el que se desea aproximar la función
%
%        Parámetros salida
%             coeficientes = matriz con los coeficientes de cada uno de las funciones
%             valor = resultado de la aproximación de xi
%              xValores = valores de X para realizar la gráfica
%              yValores = valores de Y para realizar la gráfica


function [coeficientes,  valor, xValores, yValores] = interpolacionSPLINE_Cubicas(x, y, n, xi)
 pkg load symbolic
 w1 = 0;
 wn = 0;
 h = 0;
 for i=1:n-1
   h(i)= x(i+1)-x(i);
 endfor
 
 for k=1:n-2
        b(k)=6*((y(k+2)-y(k+1))/h(k+1)-(y(k+1)-y(k))/h(k)) ;
 endfor

 % Arreglo de valores
M(1,1)=2*(h(1)+ h(2) );
M(1,2)= h(2);
B(1)=b(1)-h(1)*w1;
M(n-2,n-3)=h(n-2);
M(n-2,n-2)=2*(h(n-2)+h(n-1));
B(n-2)=b(n-2)-h(n-1)*wn;

for k=2:n-3
  M(k,k-1)=h(k);    
  M(k,k)=2*(h(k)+h(k+1));
  M(k,k+1)=h(k+1);
  B(k)=b(k);
endfor

aux=inversa(M)*B';
w(1)=w1;
w(n)=wn;
for j=2:n-1
    w(j)= aux(j-1);
end

% Primeras derivadas
for k=1:n-1
    U(k)=(y(k+1)-y(k))/h(k)-(h(k)/6)*(2*w(k)+w(k+1));
end

%Coeficientes del polinomio
for k=1:n-1
    coeficientes(k,1)=(w(k+1)-w(k))/(6*h(k));
    coeficientes(k,2)=w(k)/2-3*x(k)*coeficientes(k,1);
    coeficientes(k,3)=U(k)-x(k)*w(k)+3*coeficientes(k,1)*x(k)^2;
    coeficientes(k,4)= -coeficientes(k,1)*x(k)^3 + (x(k)^2)*w(k)/2-x(k)*U(k)+y(k);
end
  
   % Datos gráficas
   xValores = [];
   yValores = [];
   for i=1:n-1
    t(i,:)=x(i):0.01*h(i):x(i+1);
    p(i,:)=coeficientes(i,1).*(t(i,:).^3)+coeficientes(i,2).*(t(i,:).^2)+coeficientes(i,3).*t(i,:)+coeficientes(i,4);
    xValores  = cat(1, xValores, t(i, :));
    yValores = cat(1, yValores, p(i,:));
    % Para ubicar a qué función incluir xi
    if min(t(i, :) ) <= xi <= max(t(i, :))
      posicion= i;
    endif
   endfor
   
    % Creación de la ecuación a partir de los coeficientes
   for j= 1:size(coeficientes)(1)
     ecActual = 0;
     cofActual = coeficientes(j,:);
     cofActual = cofActual(:, length(cofActual):-1:1);
     syms x;
     for i = 1:length(coeficientes);;
       ecActual = ecActual + cofActual(i)*x.^(i-1);
     endfor
     ecActual= matlabFunction(ecActual);
     disp(strcat("P", num2str(j), ":"))
     disp(ecActual)
     disp(" ")
     if j == posicion
       valor  = ecActual(xi);
     endif
   endfor
  endfunction