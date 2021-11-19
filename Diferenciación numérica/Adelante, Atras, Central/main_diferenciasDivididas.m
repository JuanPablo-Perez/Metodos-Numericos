%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 18/11/2021
%Descripción : El programa tiene la finalidad de calcular
%                                 la primera y segunda derivada dada una fución
%                                 usando técnicas de diferenciación numérica


clc
clear
pkg load symbolic
warning('off','all');

disp ("Problema 1")

%                             Problema 1
% Determina la derivada con la fórmula de diferencias divididas finitas hacia
% adelante, atras y central, para f(x)=-0.1*x^4-0.15*x^3 -0.5*x^2 -0.25*x+1.2
% en x =0.5 con un valor de paso de h=0.25.

try
syms x
funcion =  -0.1*x^4-0.15*x^3 -0.5*x^2 -0.25*x+1.2;
h = 0.25;
xi = 0.5;
disp('- - - - ')
disp('Derivadas Adelante')
disp('')
[derivadasAdelante, error]= diferenciasDivididas_Adelante(funcion, xi, h)
disp('- - - - ')
disp('')
disp('Derivadas Atras')
disp('')
[derivadasAtras, error]= diferenciasDivididas_Atras(funcion, xi, h)
disp('- - - - ')
disp('')
disp('Derivadas Centrales')
disp('')
[derivadasCentral, error]= diferenciasDivididas_Central(funcion, xi, h)
disp('- - - - ')
catch err
  fprintf('Error: %s\n',err.message)

end
disp("")
disp ("Problema 2")

%                             Problema 2
% Determina la derivada con la fórmula de diferencias divididas finitas hacia
% adelante, atras y central, para f(x)=e^x en x =1.6 con un valor de paso de 
% h=0.2.
try
syms x
funcion =  exp(x);
h = 0.2;
xi = 1.6;
disp('------')
disp('Derivadas Adelante')
disp('------')
[derivadasAdelante, error]= diferenciasDivididas_Adelante(funcion, xi, h)
disp('------')
disp('')
disp('Derivadas Atras')
disp('')
[derivadasAtras, error]= diferenciasDivididas_Atras(funcion, xi, h)
disp('------ ')
disp('')
disp('Derivadas Centrales')
disp('')
[derivadasCentral, error]= diferenciasDivididas_Central(funcion, xi, h)
disp('----- ')
catch err
  fprintf('Error: %s\n',err.message)

end