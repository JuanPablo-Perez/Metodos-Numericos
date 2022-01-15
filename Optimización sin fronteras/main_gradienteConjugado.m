%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 14/12/2022
%Descripción : El método de la gradiente conjugada se encuentra entre las 
%              técnicas más útiles para resolver un gran sistema de ecuaciones
%              lineales- Pueden adopatrse para resovler grandes problemas de 
%              optimización no linel.



clc
clear
pkg load symbolic
syms x y z 
warning('off','all');
%                            Problema 1
% Encuentre el punto crítico usando el método de gradiente conjugado para
% minimizar la siguiente función   x^2 +5*y^2 - 4*x - 3*x*y con un punto inicial 
% de [1, 1].
disp("Problema 1")
try
  puntoInicial = [1, 1];
  funcion = x^2 +5*y^2 - 4*x - 3*x*y;
  iteraciones = 100;
  [matriz, puntoCritico, f_puntoCritico] = gradienteConjugado(funcion, puntoInicial, iteraciones);
  disp("Matriz solución")
  disp(matriz)
  disp("Punto crítico")
  disp(puntoCritico)
  disp("Función evaluada en el punto crítico")
  disp(f_puntoCritico)
  [X, Y] = meshgrid(-10:1:10);
  Z = double(subs(funcion, {x,y}, {X,Y}));
  figura1 = figure(1);
  hold on
  grid on
  surf(X,Y, Z)
  plot3(puntoCritico(1), puntoCritico(2), f_puntoCritico, "ro")
catch err
  fprintf('Error: %s\n',err.message)
end

disp("")
disp("")
disp("")

%                            Problema 2
% Encuentre el punto crítico usando el método de gradiente conjugado para
% minimizar la siguiente función 4*x^2-4*x*y+y^2 con un punto inicial de [2, 2].
disp("Problema 2")

try
  puntoInicial = [2, 2];
  funcion = 4*x^2-4*x*y+y^2;
  iteraciones = 100;
  [matriz, puntoCritico, f_puntoCritico] = gradienteConjugado(funcion, puntoInicial, iteraciones);
  disp("Matriz solución")
  disp(matriz)
  disp("Punto crítico")
  disp(puntoCritico)
  disp("Función evaluada en el punto crítico")
  disp(f_puntoCritico)
  [X, Y] = meshgrid(-10:1:10);
  Z = double(subs(funcion, {x,y}, {X,Y}));
  figura2 = figure(2);
  hold on
  grid on
  surf(X,Y, Z)
  plot3(puntoCritico(1), puntoCritico(2), f_puntoCritico, "ro")
catch err
  fprintf('Error: %s\n',err.message)
end



sympref reset