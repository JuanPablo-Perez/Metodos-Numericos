function [valor, error, datosGrafica] = reglaSimpson13(funcion, intervalo, n)
  a = intervalo(1);
  b = intervalo(2);
  h = (b-a)/n;
  if rem(n, 2)~= 0
    msgID = 'Regla Simpson 1/3:n debe ser un número par';
    msg = 'n debe ser un número par';
    error(msgID,msg)
  endif
  intervaloX = [];
  for i = a:h:b
    intervaloX = cat(1, intervaloX, i);
  endfor
  
  valoresY = funcion(intervaloX);
  sum = valoresY(1)+valoresY(end);
  datosGrafica = [];
  for i = 2:length(valoresY)-1;
    if rem(i, 2) ~= 0;
      sum = sum + 2*valoresY(i);
     else
      sum = sum + 4*valoresY(i);
    endif
  endfor
  valor = (b-a)*sum/(3*n);
  integralReal = integral(funcion, a, b);
  error = abs((valor - integralReal)/integralReal * 100);
  datosGrafica = [intervaloX, valoresY];
  endfunction