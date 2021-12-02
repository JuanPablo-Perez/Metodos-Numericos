%gaussLegendre_3Puntos
%       [valor, error,datosGrafica] = gaussLegendre_3Puntos(funcion, intervalo);
%
%       Parámetros entrada
%            funcion= función anónima a evaluar
%            intervalo = Intervalo donde se evaluará la integral
%
%        Parámetros salida
%             valor = valor aproximado de la integral
%             error = porcentaje de error entre la integral real, y aquella calculada
%             datosGrafica = datos que nos ayudaran a realizar la grafica de la función


function  [valor, error, datosGrafica] = gaussLegendre_3Puntos(funcion, intervalo);
  a = intervalo(1);
  b = intervalo(2);
  integralReal = integral(funcion, a, b);
  pkg load symbolic;
  valoresParabolaX = [-sqrt(3/5), 0, sqrt(3/5)];
  valoresParabolaY = funcion(valoresParabolaX);
  [ecuacionParabola,sinImportancia] = interpolacionLagrange(valoresParabolaX, valoresParabolaY, 0);
  
  funcion = sym(funcion);
  syms xd;
  syms x;
  nuevoX = ((b+a) + (b-a)*xd)/2;
  nuevoDiferencial = (b-a)/2;
  funcionNueva = subs(funcion, x, nuevoX);
  funcionNueva = nuevoDiferencial*funcionNueva;
  funcionNueva = matlabFunction(funcionNueva);
  valor = (5/9)*funcionNueva(-sqrt(3/5)) + (8/9)*funcionNueva(0)+ (5/9)*funcionNueva(sqrt(3/5));
  valor = double(valor);
  error = (valor - integralReal)*100/integralReal; 
  valoresX = linspace(-1, 1, 30);
  valoresY = double(subs(ecuacionParabola, x, valoresX));
  datosGrafica = [valoresX; valoresY];
  
  endfunction