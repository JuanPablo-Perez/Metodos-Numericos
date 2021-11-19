

function [valor, error, datosGrafica] = integralTrapecio(funcion, intervalo, n)
  n = n-1;
  a = intervalo(1);
  b = intervalo(2);
  sum = funcion(a);
  h = (b-a)/n;
  datosGrafica = [];
  x = [a];
  y = [funcion(a)];
  for i = a+h:h:b-h;
    sum = sum+2*funcion(i);
    y = cat(1, y, funcion(i));
    x = cat(1, x, i);
  endfor
  x = cat(1, x, b);
  y = cat(1, y, funcion(b));
  sum = sum + funcion(b);
  valor = (h)*sum/2;
  integralReal = integral(funcion, a, b);
  error = abs(valor - integralReal)*100/integralReal;
  datosGrafica = [x , y];
endfunction
  