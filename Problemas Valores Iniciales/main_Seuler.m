%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 17/11/2021
%Descripción : El programa tiene la finalidad de aproximar
%              la solución a un sistema de ecuaciones diferenciales 
%              con los métodos de Euler y de Heun


clear
clc


%         Problema 1 
%Estime las soluciones al siguiente sistema de ecuaciones diferenciales 
%dy1/dx = -0.5y1
%dy2/dx = 4-0.3y2-0.1y1


disp("Problema 1")
condicionesIniciales = [4,6];
numero = 2;             
intervalo = [0,2];
funcion1 = @(m1) -0.5*m1;
funcion2 = @(m1,m2)4-0.3*m2-0.1*m1;
paso = 0.5;         

try
[datos1,datos2] = Seuler(funcion1, funcion2, intervalo, condicionesIniciales, paso, numero);

disp("Valores en x")
datos2
disp("Valores en y")
datos1

figura1= figure(1);
for i = 1:numero
    subplot(numero,1,i), plot(datos2,datos1(i,:))
end
catch err
  fprintf('Error: %s\n',err.message)
end



%         Problema 2 
%Estime las soluciones al siguiente sistema de ecuaciones diferenciales 
%dy1/dx = 1/y2
%dy2/dx = y1^2

disp("Problema 2")
intervalo = [0,3];
condicionesIniciales = [1;2];
numero = 2;
paso = 0.2;
funciones = @(x,y) [1/y(2);y(1)^2];

try
[datos1,datos2] = Sheun(funciones, intervalo, condicionesIniciales, paso, numero);

disp("Valores en x")
datos2
disp("Valores en y")
datos1

figura2= figure(2);
for i = 1:numero
    subplot(numero,1,i), plot(datos2,datos1(i,:))
end

catch err
  fprintf('Error: %s\n',err.message)
end