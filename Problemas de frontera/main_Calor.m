%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 2/1/2022
%Descripción : El programa tiene la finalidad de encontar la temperatura
%              en una barra sólida en cada uno de sus puntos mediante
%              el método de diferencias finitas 

clear
clc

%           Problema 1
%Encontrar la temperatura a la que se encuentra una barra de 2cm 
%después de 10 segundos con un paso de tiempo de 0.5s y de distancia 
%de 0.5cm con k = 0.075, una temperatura de 100° a la izquierda, 50° a la derecha
%y una temepratura inicial de 0°
disp("Problema 1")
disp("      x       Temperatura")
Tiz=100;
Td=50;
L=2;
k=0.075;
Tini=0;
dt=0.5;
dx=0.5;
tf=10;
try
[T,x] = Calor(Tiz, Td, L, k, Tini,dt,dx,tf);
for i =1:((L/dx)+1);
  h(i,1)= T(i,(tf/dt)+1);
endfor 
disp([x,h])
catch err
  fprintf('Error: %s\n',err.message)
end



%           Problema 2
%Encontrar la temperatura a la que se encuentra una barra de 5cm 
%después de 8 segundos con un paso de tiempo de 0.5s y de distancia 
%de 0.25cm con k = 0.045, una temperatura de 75° a la izquierda, 32° a la derecha
%y una temepratura inicial de 5°
disp("Problema 2")
disp("      x       Temperatura")
Tiz=75;
Td=32;
L=5;
k=0.045;
Tini=5;
dt=0.5;
dx=0.25;
tf=8;
try
[T,x] = Calor(Tiz, Td, L, k, Tini,dt,dx,tf);
for i =1:((L/dx)+1);
  h(i,1)= T(i,(tf/dt)+1);
endfor 
disp([x,h])
catch err
  fprintf('Error: %s\n',err.message)
end

