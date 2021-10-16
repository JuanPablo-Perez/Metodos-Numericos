%Newton    Raices de ecuaciones (didáctica).
%   Newton(funcion)
%       [raiz,datos,i] = Newton(f,a,b,c,tol,iter)
%       raiz = raiz de la función
%       datos = todas las variables de la ejecución
%       i = número de iteraciones 
%       f = la función a tratar 
%       [a, b] = intervalo 
%       c = punto de inicio 
%       tol = tolerancia a considerar
%       iter = número máximo de iteraciones

function [raiz,datos,i] = Newton(f,a,b,c,tol=0.000001,iter=100)
  syms x
  i = 1;
  df = diff(f);
  f2 = function_handle(f);
  df2 = function_handle(df);
  while 1
    fa = f2(a);
    fb = f2(b);
    raiz = c-(f2(c))/(df2(c));
    e = abs((raiz-c)/(c));
    datos(i,1)=a;
    datos(i,2)=b;
    datos(i,3)=c;
    datos(i,4)=raiz;
    datos(i,5)=f2(raiz);
    datos(i, 6)=e;
    c = raiz;
     if (fa*fb>0)
      msgID = ' Newton-Raphson:condicion';
      msg = "El intervalo introducido no cumple Fa*Fb < 0";
      error(msgID,msg)
    elseif i>iter
      msgID = 'Newton-Raphson:iteraciones';
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
