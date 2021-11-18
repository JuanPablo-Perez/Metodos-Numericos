%diferenciasDivididas_Atras
%       [derivadas, error] = ntdiferenciasDivididas_Atras(f, xi, h);
%
%       Parámetros entrada
%            f= función simbólica objetivo
%            xi = valor que queremos evaluar
%            h = valor de paso
%
%        Parámetros salida
%             derivadas = vector con los valores de las derivadas evaluadas en xi
%             error = porcentaje de error entre la derivada real, y aquella calculada

function [derivadas, error] = diferenciasDivididas_Atras(f, xi, h);
  warning('off','all');
  syms x;
  primeraDerivada = diff(f, x);
  segundaDerivada = diff(primeraDerivada,  x);
  primeraDerivada = double(subs(primeraDerivada, x, xi));
  segundaDerivada = double(subs(segundaDerivada,  x, xi));
  derivadasReales = [primeraDerivada;  segundaDerivada];
  funcion = @(t) subs(f, x, t);
  xMenos1 = xi-h;
  xMenos2 = xi-2*h;
  xMenos3  = xi-3*h;
  f_1_Prima = (3*funcion(xi)-4*funcion(xMenos1)+funcion(xMenos2))/(2*h);
  f_2_Prima = (2*funcion(xi)-5*funcion(xMenos1)+4*funcion(xMenos2)-funcion(xMenos3))/(h^2);
  derivadas = [double(f_1_Prima); double(f_2_Prima)];
  error = abs((derivadasReales-derivadas)*100);
endfunction