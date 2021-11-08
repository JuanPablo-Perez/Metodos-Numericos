%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 08/11/2021
%Descripción : El programa tiene la finalidad de ajustar
%              a una línea recta valores de dos listas usando el
%              método de ajuste de mínimos cuadrados


%                  Problema 1
% Encuentra la recta que más se ajuste a los puntos
% (1,4), (-2,5), (3,-1) y (4,1).
disp("PROBLEMA 1")

x = [1, -2, 3, 4];
y = [4, 5, -1, 1];

try
[recta,Sr]= regresion_lineal(x, y)
disp("La ecuacion de la recta es:")
disp(recta)
% Gráfico del problema 1
figura1 = figure(1);
intervalo = min(x):(max(x)-min(x))/length(x):max(x);
y1 = recta(intervalo);
plot(intervalo, y1, "linewidth", 4);
hold on
grid on
plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end

%                  Problema 2
% Encuentra la recta que más se ajuste a los puntos
% (0, 200); (1, 195) ; ( 2,180); (4,120); (6, 25)).
disp('')
disp("PROBLEMA 2")

x = [0, 1, 2, 4, 6];
y = [200, 195, 180, 120, 25];

try
[recta,Sr]= regresion_lineal(x, y)
disp("La ecuacion de la recta es:")
disp(recta)
% Gráfico del problema 2
figura1 = figure(2);
intervalo = min(x):(max(x)-min(x))/length(x):max(x);
y1 = recta(intervalo);
plot(intervalo, y1, "linewidth", 4, 'y');
hold on
grid on
plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end