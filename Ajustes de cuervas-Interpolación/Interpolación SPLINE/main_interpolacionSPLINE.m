%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 17/11/2021
%Descripción : El programa tiene la finalidad de realizar
%                                 la interpolación mediante trazadores 
%                                  cuadráticas y cúbicas.


%                  Problema 1
% En un intervalo de tiempo de 5 segundos,
% se han obtenido ciertas mediciones
% de comportamiento de una onda
% Estime el valor en t=2 egundos
clc
clear
warning('off','all');
disp('Problema 1')
try
x = (0:5)';
y = sin(5*x)+ rand(length(x),1);
xi = 2;
[ecuacion, valor, xValores, yValores] = interpolacionSPLINE_Cuadratica(x, y, xi);
valor
[n,m]=size(xValores);
for i=1:n
  figura1 =  figure(1);
  grid on 
  hold on
  plot(xValores(i, :), yValores(i, :), 'r');
endfor
plot(x,y, 'o')
catch err
  fprintf('Error: %s\n',err.message)
end

disp('')
disp('Problema 2')
%                  Problema 2
% Interpole el valor de x = 3, a partir de la curva
% formada por los pares ordenados:
% (0.1, 10); (0.5, 1); (1.2, 0.5); (5, 0.2)
try
x=[0.1, 0.5, 1, 2, 5];
y=[10,2, 1 ,0.5, 0.2];
n=5;
xi = 3;
[coeficientes , valor, xValores, yValores] = interpolacionSPLINE_Cubicas(x, y, n, xi);
for i=1:n-1
  figura2= figure(2);
  grid on 
  hold on
  plot(xValores(i, :), yValores(i, :), 'g');
endfor
plot(x,y, 'o')
valor
catch err
  fprintf('Error: %s\n',err.message)
end