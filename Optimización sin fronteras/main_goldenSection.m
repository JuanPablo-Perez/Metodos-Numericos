%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 06/1/2022
%Descripción :El método de la sección dorada es una 
 %                            técnica para hallar el extremo mínimo o máximo
%                             mediante reducciones sucesivas de rango de valores
%                              en el cual se conoce que se conoce el extremo
%

clc
clear
warning("off", "all")

%   Problema 1
% Encuentre el punto crítico usando el método de la sección dorada
% de la función x.^3 + 5*x.^2 + 4*x + 6 en el intervalo [-2, 2].
disp("Problema 1")
try
funcion = @(x) x.^3 + 5*x.^2 + 4*x + 6;
intervalo = [-2, 2];
iteraciones = 100;
matriz = goldenSection(funcion, intervalo, iteraciones);
disp("Iteraciones    -     a     -       b     -     f(x1)     -     f(x2) ")
disp(matriz)
t = linspace(intervalo(1), intervalo(2), 100);
valores_xa = matriz(:,2);
valores_xb = matriz(:,3);
valores_ya = matriz(:, 4);
valores_yb = matriz(:, 5);
figura1= figure(1);
hold on
grid on
plot(t, funcion(t), "b", "LineWidth", 1.5)
plot(valores_xa, funcion(valores_xa), "go")
plot(valores_xb, funcion(valores_xb), "ro")
plot(matriz(end, 2), funcion(matriz(end, 2)), "ko")
disp("Punto critico:")
disp(matriz(end, 2));
disp("Valor de la funcion en el punto critico:")
disp(funcion(matriz(end, 2)))
catch err
  fprintf('Error: %s\n',err.message)
end

disp("")
disp("")
disp("")
% Problema 2
% Encuentre el punto crítico usando el método de la sección dorada
% de la función 4*x.^4 +-3*x.^3 - x./2 en el intervalo [-40, 40].
disp("Problema 2")
try
funcion = @(x) 4*x.^4 +-3*x.^3 - x./2;
intervalo = [-40, 40];
iteraciones = 100;
matriz = goldenSection(funcion, intervalo, iteraciones);
disp("Iteraciones    -     a     -       b     -     f(x1)     -     f(x2) ")
disp(matriz)
t = linspace(intervalo(1), intervalo(2), 100);
valores_xa = matriz(:,2);
valores_xb = matriz(:,3);
valores_ya = matriz(:, 4);
valores_yb = matriz(:, 5);
figura2 = figure(2);
hold on
grid on
plot(t, funcion(t), "b", "LineWidth", 1.5)
plot(valores_xa, funcion(valores_xa), "go")
plot(valores_xb, funcion(valores_xb), "ro")
plot(matriz(end, 2), funcion(matriz(end, 2)), "ko")
disp("Punto critico:")
disp(matriz(end, 2));
disp("Valor de la funcion en el punto critico:")
disp(funcion(matriz(end, 2)))
catch err
  fprintf('Error: %s\n',err.message)
end
