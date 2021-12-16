%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 15/12/2021
%Descripción : Este método usa el método de Euler para predecir un valor de y en
%              el punto medio del intervalo, este valor predicho se utiliza para
%              calcular una pendiente la cual nos ayuda a encontrar el valor de y.
clc
clear
pkg load symbolic

%                             Problema 1
% Utilizar el método del punto medio para obtener una aproximaciónde la siguiente 
% ecuación diferencial f(x)= -(x.^2).*y, la ecuación se evaluará en el intervalo
% [0,2] con una condicion inicial de f(0)=2.
disp('Problema 1')
try
  funcion = @(x, y) -(x.^2).*y;
  intervalo = [0 ,2];
  condicionInicial = 2;
  iteraciones = 10;
  [ecuacion, datos] = metodo_PuntoMedio(funcion, intervalo, condicionInicial, iteraciones);
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
% Utilizar el método del punto medio para obtener una aproximaciónde la siguiente 
% ecuación diferencial f(x)= y*x.^2-1.1*y, la ecuación se evaluará en el intervalo
% [0,1] con una condicion inicial de f(0)=1..
disp('Problema 2')
try
  funcion = @(x, y) y.*x.^2-1.1*y;
  intervalo = [0 ,1];
  condicionInicial = 1;
  iteraciones = 20;
  [ecuacion, datos] = metodo_PuntoMedio(funcion, intervalo, condicionInicial, iteraciones);
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