%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 21/12/2021
%Descripción : El programa tiene la finalidad de reemplazar derivadas
%              por cocientes incrementales utilizando las derivadas finitas 

clc 
clear
warning('off', 'all')


%                             Problema 1 
%Utilizando el método de las derivadas finitas estime la ecuación resultante
%de la siguiete ecuacion diferencial y''+4y=8*cos(2*x). Sabiendo que y(0)=0,
%y(10)=-18.26 con cinco iteraciones. 
disp("Problema 1")

try
  d2y_dx2 = sym("d2y_dx2");
  y = sym("y");
  x = sym("x");
  funcion = d2y_dx2 +4*y==8*cos(2*x);
  xFrontera1 = 0;
  yFrontera1 = 0;
  xFrontera2 = 10;
  yFrontera2 = -18.26;
  iteraciones = 5;
  [ecuacion] = diferenciasFinitas(funcion, xFrontera1, yFrontera1, xFrontera2, yFrontera2, iteraciones);
  disp('La ecuacion es:')
  disp(ecuacion)
  figura1= figure(1);
  t = linspace(xFrontera1, xFrontera2, 100);
  plot(t, ecuacion(t), "-r")
  
  hold on 
  grid on
  ecuacion = @(x)- 2.*x.*sin(2.*x);
  plot(t, ecuacion(t), '-b')
catch err
  fprintf('Error: %s\n',err.message)
end

disp("")
disp("")
disp("")

%                             Problema 2
%Utilizando el método de las derivadas finitas estime la ecuación resultante
%de la siguiete ecuacion diferencial y''-2y==3*cos(6*x). Sabiendo que y(0)=0,
%y(1)=-2 con siete iteraciones. 
disp("Problema 2")

try
  d2y_dx2 = sym("d2y_dx2");
  y = sym("y");
  x = sym("x");
  funcion = d2y_dx2 -2*y==3*cos(6*x);
  xFrontera1 = 0;
  yFrontera1 = 0;
  xFrontera2 = 1;
  yFrontera2 = 2;
  iteraciones = 7;
  [ecuacion] = diferenciasFinitas(funcion, xFrontera1, yFrontera1, xFrontera2, yFrontera2, iteraciones);
  disp('La ecuacion es:')
  disp(ecuacion)
  figura2= figure(2);
  t = linspace(xFrontera1, xFrontera2, 100);
  plot(t, ecuacion(t), "-r")
  
  hold on 
  grid on
catch err
  fprintf('Error: %s\n',err.message)
end