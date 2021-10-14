%Secante    Raices de ecuaciones (didáctica).
%   Secante(funcion)
%       [raiz,datos] = Secante(funcion, intervalo, n_iteraciones, tolerancia)
%       raiz = raiz de la función
%       datos = todas las variables de la ejecución
%       funcion = la función a tratar 
%       intervalo = [a, b]
%       tolerancia = tolerancia a considerar
%       n_iteraciones = número máximo de iteraciones
%
function [raiz, datos] = Secante(funcion, intervalo, n_iteraciones, tolerancia = 0.00001)
  format long;
  a = intervalo(1)
  b = intervalo(2)
  datos = [];
  i = 1;
  while 1
    disp(strcat("Numero iteracion: "))
    disp(a);
    disp(b);
    Fa = funcion(a)
    Fb = funcion(b)
    raiz = b - (Fb*(a-b))/(Fa-Fb);
  
    if Fb*Fa > 0
      msgID = ' SECANTE:condicion';
      msg = "El intervalo introducido no cumple Fa*Fb < 0";
      error(msgID,msg)
      
    else if i > n_iteraciones
      msgID = 'SECANTE:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg)
      
    else
      if abs(raiz-a)<tolerancia
        break;
      endif
     endif
      datos = cat ( 1 , datos, raiz);
      a = b;
      b = raiz;
    endif
    i=i+1;
  end;
