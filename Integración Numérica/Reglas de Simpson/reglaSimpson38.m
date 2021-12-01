%reglaSimpson38
%       [valor, error,datosGrafica] = reglaSimpson38(funcion, intervalo, n);
%
%       Par�metros entrada
%            funcion= funci�n simb�lica
%            intervalo = Intervalo donde se evaluar� la integral
%            n = segmentos m�ltiplo de 3 en el que se dividir� el intervalo
%
%        Par�metros salida
%             valor = valor aproximado de la integral
%             error = porcentaje de error entre la integral real, y aquella calculada
%             datosGrafica = datos que nos ayudaran a realizar la grafica de la funci�n
function [valor, error, datosGrafica] = reglaSimpson38(funcion, intervalo, n)
  a = intervalo(1);
  b = intervalo(2);
  h = (b-a)/n;
  if rem(n, 3)~= 0
    msgID = 'Regla Simpson 3/8:n debe ser m�ltiplo de 3 ';
    msg = 'n debe ser m�ltiple de 3';
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
    if rem(i-1, 3) ~= 0;
      sum = sum + 3*valoresY(i);
     else
      sum = sum + 2*valoresY(i);
    endif
  endfor
  valor = 3*(b-a)*sum/(8*n);
  integralReal = integral(funcion, a, b);
  error = abs((valor - integralReal)/integralReal * 100);
  datosGrafica = [intervaloX, valoresY];
  endfunction