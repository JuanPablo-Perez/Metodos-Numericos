%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 12/11/2021
%Descripción : El programa tiene la finalidad de aproximar
%                                 un valor mediante a interpolación polinomial
%                                 de Newton


%                  Problema 1
% Estime el valor del logaritmo de base 15 de 7, sabiendo que
% los pares ordenados son soluciones:
% (1, 0); (4, 0.51191); (5, 0.59431); (3, 0.40568)
% ( 9, 0.81136); (8, 0.76787); (10, 0.85027)
warning('off','all');
pkg load symbolic
try
disp("Problema 1")
x = [1,4, 5, 3, 9, 8, 10];
y = [0, 0.51191, 0.59431, 0.40568, 0.81136, 0.76787, 0.85027];
xi = 7;
[ecuacion, valor]= interpolacionLagrange(x,y,  xi);
disp("La  ecuacion es :")
disp(ecuacion)
disp('')
disp('El valor es:')
disp(valor)
figura1= figure(1);
  intervalo = min(x):(max(x)-min(x))/(5*length(x)):max(x);
  y1 = ecuacion(intervalo);
  plot(intervalo, y1, "linewidth", 4, 'r');
  hold on
  grid on
  plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end



%                  Problema 2
% Obtener el polinomio de interpolación de Lagrange con 
% con los siguientes valores:
% (5, -387); (-5, 333); (3, -83); (-1, -3)
% Interpolar en el punto x=2

try
 disp('')
disp("Problema 2")
x = [5, -5, 3, -1];
y = [-387, 333, -83, -3];
xi = 2;
[ecuacion, valor]= interpolacionLagrange(x,y,  xi);
disp("La  ecuacion es :")
disp(ecuacion)
disp('')
disp('El valor es:')
disp(valor)
figura2= figure(2);
  intervalo = min(x):(max(x)-min(x))/(5*length(x)):max(x);
  y1 = ecuacion(intervalo);
  plot(intervalo, y1, "linewidth", 4, 'g');
  hold on
  grid on
  plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end