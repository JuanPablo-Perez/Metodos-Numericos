%biseccion
%       [raiz,datos,i] =  biseccion(ecuacion ,intervalo, tol, iter) 
%
%       raiz = raiz de la función
%       datos = todas las variables de la ejecución
%       i = número de iteraciones 
%       ecuacion = la función a tratar 
%       intervalo = [a, b] 
%       tol = tolerancia a considerar
%       iter = número máximo de iteraciones



function   [raiz, datos, iteraciones] = biseccion(ecuacion, intervalo, tol=0.0001,iter=100);
  pkg load symbolic,
  syms  x;
  datos = [];
  format  long;
  iteraciones = 1;
  while 1
    Fa = double(subs(ecuacion, x, intervalo(1)));
    c= double((intervalo(1)+intervalo(2))/2) ;
    raiz = c;
    Fc= double(subs(ecuacion,  x, c));
    datos = cat(1, datos,  c);
    if Fc == 0
      return  ;
    elseif  Fc*Fa>0
        intervalo = [c, intervalo(2)];
     else
        intervalo = [intervalo(1), c];
    endif
    if tol>abs(Fc)
            return;
    elseif iteraciones > iter
      msgID = 'Bisección:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg)
    else
      iteraciones = iteraciones+1;
      endif
  endwhile
endfunction