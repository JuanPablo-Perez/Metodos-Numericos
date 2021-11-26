%Raicesmultiples
%       [raices, errores, it] = Raicesmultiples(f,a,b,tol=0.000001,iter=100)
%
%       Parámetros entrada
%            f = función 
%            a = Valor inicial
%            b = Valor final
%            xi = valor en el que se desea aproximar la función
%
%        Parámetros salida
%             raices = vector con las raices encontradas
%             errores = vector con los errores
%             it = cantidad de iteraciones en cada raiz

function [raices,errores,it] = Raicesmultiples(f,a,b,tol=0.000001,iter=100)
  syms x
  k = 0;
  i = 0;
  u = f/diff(f);
  u2 = u/diff(u);
  u2f = function_handle(u2);
  f2 = function_handle(f);
  j = a;
  while j < b
    fj=f2(j);
    %Valor cercano a la raiz
    if abs(fj)<0.5
      c = j;
      while 1
        % Calculo del error en el valor cercano a la raiz
        k = k+1;
        raiz = c-u2f(c);
        error = abs((raiz-c)/(c));
        c = raiz;
      if i>iter
        msgID = 'Newton-Raphson:iteraciones';
        msg = 'Gran número de iteraciones, posiblemente el método divergió';
        error(msgID,msg)
       end 
       
        if error < tol
          i = i+1;
          raices(1,i) = raiz;
          errores(1,i) = error;
          it(1,i) = k; 
          k = 0;
          break
        endif
      endwhile
    endif
    j=j+0.75;
  endwhile
end