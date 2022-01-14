%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 13/01/2022
%Descripción : El programa tiene la finalidad de minimizar los problemas de
%              optimización multivariable sin restricciones


clc
clear
pkg load symbolic
syms x y z 
warning('off','all');

%                            Problema 1
% Encuentre el punto mínimo usando el método de Newton 
% en la siguiente funcion (x-4)^2+(y-3)^2 + 4*(z+5)^2
% empezando en el punto [0, 0, 0]
disp("Problema 1")
try
funcion = (x-4)^2+(y-3)^2 + 4*(z+5)^2
puntoInicio = [0, 0, 0];
iteraciones = 100;
[matriz, puntoMinimo, f_puntoMinimo] = newtonOptimizacion(funcion, puntoInicio, iteraciones)

catch err
  fprintf('Error: %s\n',err.message)
end

%                            Problema 2
% Encuentre el punto mínimo usando el método de Newton 
% en la siguiente funcion (x)^3+(y-1)^2 + 2*(z-5)^2
% empezando en el punto [0, 0, 0]

disp("Problema 2")
try
funcion = (x)^3+(y-1)^2 + 2*(z-5)^2
puntoInicio = [0, 0, 0];
iteraciones = 100;
[matriz, puntoMinimo, f_puntoMinimo] = newtonOptimizacion(funcion, puntoInicio, iteraciones)

catch err
  fprintf('Error: %s\n',err.message)
end
sympref reset
