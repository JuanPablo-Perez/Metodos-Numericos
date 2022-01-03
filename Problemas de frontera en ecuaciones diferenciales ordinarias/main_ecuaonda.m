%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 02/1/2022
%Descripción : La ecuación de onda es un ente matemático capaz de describir el 
%              comportamiento de fenómenos ondulatorios que van desde la vibración
%              de una cuerda hasta algunos fenómenos luminosos.

clc 
clear
warning('off', 'all')

%                             Problema 1 
%Utilizando el método de las derivadas finitas epara resolver la ecuación de la onda
%de una cuerda vibrante se tiene que:
%u_[tt]  = 4u_[xxi] para 0 < x < 1 y 0 < t < 0.5,con las condiciones de frontera:
%u_[0,t] = 0; u_[1,t]=0; para 0 < t < 0.5 y las condiciones iniciales:
%u_[x,0] = f[x] = sin(pi*x) + sin(2*pi*x) para 0 < x < 1 y 
%u_t[x,0] = g[x] = 0 para  0 < x < 1 . 
disp("Problema 1")
try
  f = @(x) sin(pi*x) + sin(2*pi*x);
  g = @ (x) 0;
  a = 1;
  b = 0.5;
  c = 2;
  n = 11;
  m = 11;
  [U] = ecuaonda(f,g,a,b,c,n,m) ; 
  disp('La solución es:')
  disp(U)
  figura1= figure(1);
  surf(U)
catch err
  fprintf('Error: %s\n',err.message)
end

disp("")
disp("")
disp("")

%                             Problema 2
%Utilizando el método de las derivadas finitas epara resolver la ecuación de la onda
%de una cuerda vibrante se tiene que:
%u_[tt]  = 4u_[xxi] para 0 < x < 1 y 0 < t < 2,con las condiciones de frontera:
%u_[0,t] = 0; u_[1,t]=0; para 0 < t < 2 y las condiciones iniciales:
%u_[x,0] = f[x] = sin(pi*x) y u_t[x,0] = g[x] = 0 para  0 < x < 1 . 
disp("Problema 2")

try
  f = @(x) sin(pi*x) ;
  g = @ (x) 0;
  a = 1;
  b = 2;
  c = 2;
  n = 5;
  m = 20;
  [U] = ecuaonda(f,g,a,b,c,n,m);
  disp('La aprocimación a la solución es:')
  disp(U)
  figura2= figure(2);
  surf(U)
catch err
  fprintf('Error: %s\n',err.message)
end

  
  
  
  
  