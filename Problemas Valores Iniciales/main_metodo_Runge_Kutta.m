%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 16/12/2021
%Descripción : El método Runge Kutta on un conjunto de métodos iterativos (implícitos y explícitos)
%              para la aproximación de soluciones de ecuaciones diferenciales  ordinarias, 
%              concretamente, del problema de valor inicial.
clc
clc
clear
pkg load symbolic
warning('off','all')
%                             Problema 1
% Utilizar el método de segundo orden de Runge Kutta para obtener una aproximaciónde la siguiente 
% ecuación diferencial f(x)= -2*x^3+12*x^2-20*x+8.5, la ecuación se evaluará en el intervalo
% [0,4] con una condicion inicial de f(0)=1 con ocho iteraciones .
disp('Problema 1')
try
  funcion = @(x) -2*x^3+12*x^2-20*x+8.5;
  condicionInicial = 1;
  intervalo = [0, 4];
  iteraciones = 8;
  [ecuacion, datos] = metodo_Runge_Kutta(funcion, intervalo, condicionInicial, iteraciones, 2);
  disp('La ecuacion es:')
  disp(ecuacion)
  disp('Los resultados son:')
  disp("X - Y - Error")
  disp(datos)
  figura1= figure(1);
  t = linspace(intervalo(1), intervalo(2), 100);
  plot(t, ecuacion(t), "-r")
catch err
  fprintf('Error: %s\n',err.message);
end
disp ('')
disp ('')
%                             Problema 2
% Utilizar el método de segundo orden de Runge Kutta para obtener una aproximaciónde la siguiente 
% ecuación diferencial f(x)= x.^3 + 7*x.^2 - + 5 *x, la ecuación se evaluará en el intervalo
% [0,6] con una condicion inicial de f(0)=2 con diez iteraciones .
disp('Problema 2')
try
  funcion = @(x) x.^3 + 7*x.^2 - + 5 *x;
  condicionInicial = 2;
  intervalo = [0, 6];
  iteraciones = 10;
  [ecuacion, datos] = metodo_Runge_Kutta(funcion, intervalo, condicionInicial, iteraciones, 3);
  disp('La ecuacion es:')
  disp(ecuacion)
  disp('Los resultados son:')
  disp("X - Y - Error")
  disp(datos)
  figura2= figure(2);
  t = linspace(intervalo(1), intervalo(2), 100);
  plot(t, ecuacion(t), "-r")
catch err
  fprintf('Error: %s\n',err.message);
end
disp ('')
disp ('')