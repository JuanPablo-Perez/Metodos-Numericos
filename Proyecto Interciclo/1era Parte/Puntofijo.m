%Puntofijo    Raices de ecuaciones (didáctica).
%   Puntofijo(funcion)
%       [raiz,datos,i] = Puntofijo(f , g , intervalo ,c , tol , iter)
%       raiz = raiz de la función
%       datos = todas las variables de la ejecución
%       i = número de iteraciones 
%       f = la función a tratar 
%       g = función de la forma x=g(x)
%       intervalo = [a, b] 
%       c = punto de inicio 
%       tol = tolerancia a considerar
%       iter = número máximo de iteraciones

function [raiz,datos,i] = Puntofijo(f,g,intervalo,c,tol=0.0001,iter=100)
  a = intervalo(1);
  b = intervalo(2);
 syms x
f = function_handle(f);
i = 1;
  while 1
    fa = f(a);
    fb = f(b);
    raiz = g(c);
    e = abs((raiz-c)/(c));
    datos(i,1)=a;
    datos(i,2)=b;
    datos(i,3)=c;
    datos(i,4)=raiz;
    datos(i,5)=f(raiz);
    datos(i, 6)=e;
    c = raiz;
     if (fa*fb>0)
      msgID = ' Punto fijo:condicion';
      msg = "El intervalo introducido no cumple Fa*Fb < 0";
      error(msgID,msg)
    elseif i>iter
      msgID = 'Punto fijo:Gran nullmero de iteraciones, posiblemente el metodo divergio';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg)
    else
        if e < tol
            break;
        end
    end
    i=i+1;
  endwhile
end