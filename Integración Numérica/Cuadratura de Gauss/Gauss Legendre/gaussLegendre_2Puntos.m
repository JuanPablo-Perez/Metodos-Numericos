%gaussLegendre_2Puntos
%       [valor, error,datosGrafica] = gaussLegendre_2Puntos(funcion, intervalo);
%
%       Parámetros entrada
%            funcion= función anónima a evaluar
%            intervalo = Intervalo donde se evaluará la integral
%
%        Parámetros salida
%             valor = valor aproximado de la integral
%             error = porcentaje de error entre la integral real, y aquella calculada
%             datosGrafica = datos que nos ayudaran a realizar la grafica de la función

function  [valor, error, datosGrafica] = gaussLegendre_2Puntos(funcion, intervalo);
  a = intervalo(1);
  b = intervalo(2);
  integralReal = integral(funcion, a, b);
  pkg load symbolic;
  funcion = sym(funcion);
  syms xd;
  syms x;
  nuevoX = ((b+a) + (b-a)*xd)/2;
  nuevoDiferencial = (b-a)/2;
  funcionNueva = subs(funcion, x, nuevoX);
  funcionNueva = nuevoDiferencial*funcionNueva;
  funcionNueva = matlabFunction(funcionNueva);
  valor = funcionNueva(-1/(sqrt(3))) + funcionNueva(1/(sqrt(3)));
  valor = double(valor);
  error = (valor - integralReal)*100/integralReal; 
  valoresX = linspace(-1, 1, 30);
  syms k;
  funcionY = [funcionNueva(1/(sqrt(3))) - funcionNueva(-1/(sqrt(3)))]/[2/(sqrt(3))]*k;
  valoresY = double(subs(funcionY, k, valoresX));
  datosGrafica = [valoresX; valoresY];
  endfunction