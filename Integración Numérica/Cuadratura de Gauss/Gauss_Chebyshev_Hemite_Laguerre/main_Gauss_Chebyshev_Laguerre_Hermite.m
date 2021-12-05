%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 3/12/2021
%Descripción : El programa tiene la finalidad de calcular
%              la integral de una función mediante la cuadratura 
%              de Gauss Laguerre, Chebyshev y Hermite.

clear 
clc
pkg load symbolic


%          Problema 1
% Utilizar la regla de cuadraturas de gauss_Chebyshev 
%con 20000 puntos base para obtener una aproximación de la integral 
% (x.^4-5*x)


try
disp('Gauss Chebyshev')
funcion = @(x)  (x.^4-5*x);
% La función debe ser de la forma f(x), tal que F(x) = f(x)*1/sqrt(1-x^2)
[valor, error] = gauss_Chebyshev(funcion, 20000)
disp('')
disp('')
catch err
  fprintf('Error: %s\n',err.message)
end


%          Problema 2
% Utilizar la regla de cuadraturas de gauss_Laguerre
%con 5 puntos base para obtener una aproximación de la integral 
% x.^2
try
disp('Gauss Laguerre')
funcion = @(x)  x.^2;
% La función debe ser de la forma f(x), tal que F(x) = f(x)*exp(-x)
n=5;
[valor] = gauss_Laguerre(funcion, n)
disp('')
disp('')
catch err
  fprintf('Error: %s\n',err.message)
end

%          Problema 3
% Utilizar la regla de cuadraturas de gauss_Hermite
%con 5 puntos base para obtener una aproximación de la integral 
% 2*x.^2+5*x 

try
disp('Gauss Hermite')
funcion = @(x) 2*x.^2+5*x ;
% La función debe ser de la forma f(x), tal que F(x) = f(x)*exp(-x^2)
n=5;
[valor] = gauss_Hermite(funcion, n)
catch err
  fprintf('Error: %s\n',err.message)
end
