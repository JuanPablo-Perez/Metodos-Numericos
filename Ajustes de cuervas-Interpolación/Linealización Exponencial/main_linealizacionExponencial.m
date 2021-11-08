%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 08/11/2021
%Descripción : El programa tiene la finalidad de linealizar
%                                 una relación no lineal usando el modelo 
%                                 exponencial


%                  Problema 1
% Encuentra la ecuación que más se ajuste a los puntos
% (2.5, 13) ; (3.5, 11) ; (5, 8.5) ; (6, 8.2) ; (7.5, 7)
%  (10, 6.2) ; (12.5, 5.2) ; (15, 4.8) ; (17.5, 4.6) ; (20, 4.3) ; 

x = [2.5, 3.5, 5, 6, 7.5, 10,12.5, 15, 17.5, 20];
y = [13, 11, 8.5, 8.2, 7, 6.2, 5.2, 4.8,4.6, 4.3];
disp("PROBLEMA 1")
try
linealizacion= linealizacionExponencial(x, y);
disp("La ecuacion aproximada es:")
disp(linealizacion)
% Gráfico del problema 1
figura1 = figure(1);
intervalo = min(x):(max(x)-min(x))/length(x):max(x);
y1 = linealizacion(intervalo);
plot(intervalo, y1, "linewidth", 4, 'g');
hold on
grid on
plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end


%                  Problema 2
% Encuentra la ecuación que más se ajuste a los puntos
% (1,0.5), (2,1.7), (3,3.4) y (4,5.7), (5, 8.4)
x = [1, 2, 3, 4, 5];
y = [0.5, 1.7, 3.4, 5.7, 8.4];
disp('')
disp("PROBLEMA 2")
try
linealizacion= linealizacionExponencial(x, y);
disp("La ecuacion aproximada es:")
disp(linealizacion)
% Gráfico del problema 2
figura1 = figure(2);
intervalo = min(x):(max(x)-min(x))/length(x):max(x);
y1 = linealizacion(intervalo);
plot(intervalo, y1, "linewidth", 4, 'y');
hold on
grid on
plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end
