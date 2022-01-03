%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 02/1/2022
%Descripción : La finalidad del script es la de resolver ecuaciones diferenciales
%                              usando los métodos de diferencias finitas de Laplace 
%                              y de Poisson

clc
clear
warning("off", "all")

%   Problema 1
% Encuentre la solucion a un sistema de temperatura, tal que sus valores de contorno son:
% 60, 60, 50, 70. Use el método de diferencias finitas de Laplace, con 100 iteraciones.
disp("Problema 1")
try
valoresContorno = [60, 60, 50, 70];
numFilas = 10;
numColumnas = 10;
iteraciones = 100;
tolerancia = 0.001;
[matrizSolucion, iteraciones] =diferenciasFinitas_Laplace(valoresContorno(1), valoresContorno(2), valoresContorno(3), valoresContorno(4), numFilas, numColumnas, iteraciones, tolerancia)
disp("Iteraciones totales:")
disp(iteraciones)
figura1 = figure(1);
[valoresX, valoresY] = meshgrid(1: numColumnas+2, 1:numFilas+2);
surf(valoresX, valoresY, matrizSolucion)
catch err
  fprintf('Error: %s\n',err.message)
end

disp("")
disp("")
disp("")
% Problema 2
% Encuentre la solución a la ecuación dy/dx = 12x^2   y(0) = 0,      y(1)=0
% en el intervalo de 0 a 1. Use el método de diferencias finitas de Poisson 
% con 100 iteraciones
disp("Problema 2")
try
intervalo = [0, 1];
numIteraciones= 100;
solucion = diferenciasFinitas_Poisson(intervalo, numIteraciones);
intervaloX = intervalo(1):(intervalo(2)-intervalo(1))/numIteraciones:intervalo(2);
solReal = @(x) x.^4 - x;
figura1 = figure(2);
plot(intervaloX, solucion, "o", intervaloX, solReal(intervaloX));
catch err
  fprintf('Error: %s\n',err.message)
end