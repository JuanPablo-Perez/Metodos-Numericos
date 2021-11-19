%diferenciasDivididas_Central
%       [derivadas, error] = ntdiferenciasDivididas_Central(f, xi, h);
%
%       Parámetros entrada
%            f= función simbólica objetivo
%            xi = valor que queremos evaluar
%            h = valor de paso
%
%        Parámetros salida
%             derivadas = vector con los valores de las derivadas evaluadas en xi
%             error = porcentaje de error entre la derivada real, y aquella calculada

function [derivadas, error] = diferenciasDivididas_Central(f, xi, h);
  warning('off','all');
  syms x;
  primeraDerivada = diff(f, x);
  segundaDerivada = diff(primeraDerivada,  x);
  primeraDerivada = double(subs(primeraDerivada, x, xi));
  segundaDerivada = double(subs(segundaDerivada,  x, xi));
  derivadasReales = [primeraDerivada;  segundaDerivada];
  funcion = @(t) subs(f, x, t);
  xMas1 = xi+h;
  xMenos1 = xi-h;
  xMas2 = xi+2*h;
  xMenos2 = xi-2*h;
  f_1_Prima = (-funcion(xMas2)+8*funcion(xMas1)-8*funcion(xMenos1)+funcion(xMenos2))/(12*h);
  f_2_Prima = (-funcion(xMas2)+16*funcion(xMas1)-30*funcion(xi)+16*funcion(xMenos1)-funcion(xMenos2))/(12*h^2);
  derivadas = [double(f_1_Prima); double(f_2_Prima)];
  error = abs((derivadasReales-derivadas)*100);
endfunction