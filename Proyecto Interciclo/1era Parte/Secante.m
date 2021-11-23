%Secante    Raices de ecuaciones (didáctica).
%   Secante(funcion,a,b,tolerancia,n_iteraciones)
%       [raiz,datos, i] = Secante(funcion, intervalo, tol, iter)
%       i = numero iteraciones
%       raiz = raiz de la función
%       datos = todas las variables de la ejecución
%       funcion = la función a tratar 
%       intervalo = [a, b]
%       tolerancia = tolerancia a considerar
%       iter= número máximo de iteraciones
%
function [raiz, datos,i] = Secante(funcion,intervalo, tol = 0.00001,iter= 100)
  a = intervalo(1);
  b = intervalo(2);
syms x
i = 1;
f = function_handle(funcion);
  while 1
    Fa = f(a);
    Fb = f(b);
    raiz = b - (Fb*(a-b))/(Fa-Fb);
    Fraiz = f(raiz);
    datos(i,1)=a;
    datos(i,2)=b;
    datos(i,3)=raiz;
    datos(i,4)=Fa;
    datos(i,5)=Fb;
    datos(i,6)=Fraiz;
    datos(i,7)=abs(raiz-a);
    a = b;
    b = raiz;
    if i > iter
      msgID = 'SECANTE:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg)    
    else
      if abs((raiz-a)/raiz)<tol
        break;
      end
    end
    i = i+1;
  endwhile
 end