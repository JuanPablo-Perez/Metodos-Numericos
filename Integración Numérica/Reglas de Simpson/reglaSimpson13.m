%reglaSimpson13
%       [valor, error,datosGrafica] = reglaSimpson13(funcion, intervalo, n);
%
%       Parámetros entrada
%            funcion= función simbólica
%            intervalo = Intervalo donde se evaluará la integral
%            n = segmentos pares en el que se dividirá el intervalo
%
%        Parámetros salida
%             valor = valor aproximado de la integral
%             error = porcentaje de error entre la integral real, y aquella calculada
%             datosGrafica = datos que nos ayudaran a realizar la grafica de la función

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