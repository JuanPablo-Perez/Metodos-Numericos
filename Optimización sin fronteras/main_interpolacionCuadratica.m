%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 07/1/2022
%Descripción :El método de la interpolación cuadrática consiste en hallar
%                             un valor dentro de un intervalo en el que conocemos los valores
%                              de los extremos, cuando se tomen inicialmente 3 puntos.

clc
clear
warning("off", "all")

%   Problema 1
% Encuentre el punto crítico usando el método de interpolación cuadrática
% de la función exp(-2*x)+x.^2 en el intervalo [-5, 5 ].
disp("Problema 1")
try
funcion = @(x) exp(-2*x)+x.^2;
intervalo = [-5, 5];
iteraciones = 100;
[matriz, puntoCritico, funcion_puntoCritico] = interpolacionCuadratica(funcion, intervalo,  iteraciones);
disp("Iteraciones    -        x1        -          x2         -          x3         -          f(x1)         -        f(x2)        -       f(x3)     ")
disp(matriz)
puntoCritico
funcion_puntoCritico
figura1 = figure(1);
t = linspace(intervalo(1), intervalo(2), 100);
hold on
plot(t, funcion(t), "b", "LineWidth", 1.5)
plot(matriz(:, 3), matriz(:, 6), "go")
plot(puntoCritico, funcion_puntoCritico, "ko")
catch err
  fprintf('Error: %s\n',err.message)
end



disp("")
disp("")
disp("")
% Problema 2
% Encuentre el punto crítico usando el método de interpolación cuadrática
% de la función exp(x.^2)+2*x.^2*exp(-x) en el intervalo [-1, 1].
disp("Problema 2")
try
funcion = @(x) exp(x.^2)+2*(x.^2).*exp(-x);
intervalo = [-1, 1];
iteraciones = 100;
[matriz, puntoCritico, funcion_puntoCritico] = interpolacionCuadratica(funcion, intervalo,  iteraciones);
disp("Iteraciones -   x1   -     x2    -     x3    -     f(x1)    -   f(x2)    -  f(x3) ")
disp(matriz)
puntoCritico
funcion_puntoCritico
figura2 = figure(2);
t = linspace(intervalo(1), intervalo(2), 100);
hold on
plot(t, funcion(t), "b", "LineWidth", 1.5)
plot(matriz(:, 3), matriz(:, 6), "go")
plot(puntoCritico, funcion_puntoCritico, "ko")
catch err
  fprintf('Error: %s\n',err.message)
end
