%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 10/12/2022
%Descripción : El método de descenso más pronunciado es una de las técnicas de 
%              búsqueda más antiguas y conocidas para minimizar los problemas de
%              optimización multivariable sin restricciones

clc
clear
pkg load symbolic
syms x y z 
warning('off','all');

%                            Problema 1
% Encuentre el punto mínimo usando el método de descenso más pronunciado para
% minimizar la siguiente función   0.5*x^2+y^2+x+0.5*y+3 en el intervalo [0, 0].
disp("Problema 1")
try
  
  funcion = 0.5*x^2+y^2+x+0.5*y+3;
  puntoInicial = [0,0];
  iterMax = 100;
  [matriz, puntoMinimo, f_puntoMinimo] = steepestDescent(funcion, puntoInicial, iterMax);
  [X, Y] = meshgrid(-10:1:10);
  Z = double(subs(funcion, {x,y}, {X,Y}));
  figura1 = figure(1);
  hold on
  grid on
  surf(X,Y, Z)
  plot3(puntoMinimo(1), puntoMinimo(2), f_puntoMinimo, "ro")
  disp("Matriz solución")
  disp(matriz)
  disp("Punto mínimo")
  disp(puntoMinimo)
  disp("Función evaluada en el punto mínimo")
  disp(f_puntoMinimo)
catch err
  fprintf('Error: %s\n',err.message)
end
disp("")
disp("")
disp("")

%                            Problema 2
% Encuentre el punto mínimo usando el método de descenso más pronunciado para
% minimizar la siguiente función x^2+2*y^2+(0.01*(x*y)^2) en el intervalo
% [1, 1].
disp("Problema 2")

try
  funcion= x^2+2*y^2+(0.01*(x*y)^2);
  puntoInicial = [1, 1];
  iterMax = 100;
  [matriz, puntoMinimo, f_puntoMinimo] = steepestDescent(funcion, puntoInicial, iterMax);
  [X, Y] = meshgrid(-10:1:10);
  Z = double(subs(funcion, {x,y}, {X,Y}));
  figura2 = figure(2);
  hold on
  grid on
  surf(X,Y, Z)
  plot3(puntoMinimo(1), puntoMinimo(2), f_puntoMinimo, "ro")
  disp("Matriz solución")
  disp(matriz)
  disp("Punto mínimo")
  disp(puntoMinimo)
  disp("Función evaluada en el punto mínimo")
  disp(f_puntoMinimo)
catch err
  fprintf('Error: %s\n',err.message)
end

sympref reset