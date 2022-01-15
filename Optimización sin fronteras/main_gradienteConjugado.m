%Autores : Carlos Calle, Francisco Cedillo y Juan P�rez
%
%Fecha : 14/12/2022
%Descripci�n : El m�todo de la gradiente conjugada se encuentra entre las 
%              t�cnicas m�s �tiles para resolver un gran sistema de ecuaciones
%              lineales- Pueden adopatrse para resovler grandes problemas de 
%              optimizaci�n no linel.



clc
clear
pkg load symbolic
syms x y z 
warning('off','all');
%                            Problema 1
% Encuentre el punto cr�tico usando el m�todo de gradiente conjugado para
% minimizar la siguiente funci�n   x^2 +5*y^2 - 4*x - 3*x*y con un punto inicial 
% de [1, 1].
disp("Problema 1")
try
  puntoInicial = [1, 1];
  funcion = x^2 +5*y^2 - 4*x - 3*x*y;
  iteraciones = 100;
  [matriz, puntoCritico, f_puntoCritico] = gradienteConjugado(funcion, puntoInicial, iteraciones);
  disp("Matriz soluci�n")
  disp(matriz)
  disp("Punto cr�tico")
  disp(puntoCritico)
  disp("Funci�n evaluada en el punto cr�tico")
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
% Encuentre el punto cr�tico usando el m�todo de gradiente conjugado para
% minimizar la siguiente funci�n 4*x^2-4*x*y+y^2 con un punto inicial de [2, 2].
disp("Problema 2")

try
  puntoInicial = [2, 2];
  funcion = 4*x^2-4*x*y+y^2;
  iteraciones = 100;
  [matriz, puntoCritico, f_puntoCritico] = gradienteConjugado(funcion, puntoInicial, iteraciones);
  disp("Matriz soluci�n")
  disp(matriz)
  disp("Punto cr�tico")
  disp(puntoCritico)
  disp("Funci�n evaluada en el punto cr�tico")
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