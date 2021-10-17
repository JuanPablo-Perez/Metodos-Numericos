%Secante    Raices de ecuaciones (did�ctica).
%   Secante(funcion,a,b,tolerancia,n_iteraciones)
%       [raiz,datos] = Secante(funcion, intervalo, n_iteraciones, tolerancia)
%       raiz = raiz de la funci�n
%       datos = todas las variables de la ejecuci�n
%       funcion = la funci�n a tratar 
%       intervalo = [a, b]
%       tolerancia = tolerancia a considerar
%       n_iteraciones = n�mero m�ximo de iteraciones
%
function [raiz, datos,i] = Secante(funcion,a,b, tolerancia = 0.00001,n_iteraciones = 1000)

  i = 1;
  f = funcion;
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
    if i > n_iteraciones
      msgID = 'SECANTE:iteraciones';
      msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
      error(msgID,msg)    
    else
      if abs((raiz-a)/raiz)<tolerancia
        break;
      end
    end
    i = i+1;
  endwhile
 end