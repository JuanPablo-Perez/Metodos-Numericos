%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 15/12/2021
%Descripción : El programa tiene la finalidad de predecir un nuevo valor de y
%              usando la pendiente mediante el método de euler.

 
clc
clear
pkg load symbolic
warning('off','all')


%                             Problema 1
% Utilizar el método de euler para obtener una aproximaciónde la siguiente 
% ecuación diferenciales f(x)= -2*x.^3+12*x.^2-20*x+8.5, la ecuación se evaluará
% en el intervalo [0,3] con una condicion inicial de f(0)=1.
disp('Problema 1')
try
 funcion = @(x) -2*x.^3+12*x.^2-20*x+8.5;
 intervalo = [0 , 4];
 condicionInicial = 1;
 iteraciones = 100;
 orden = 3;
 [valor, error, estabilidad] = metodo_Euler(funcion, intervalo, condicionInicial, iteraciones, orden);
  disp('El valor aproximado es:')
  disp(valor)
  disp ('')
  disp('El error estimado es:')
  disp(error)
  disp('')
  disp(estabilidad)
 catch err
  fprintf('Error: %s\n',err.message);
end
disp ('')
disp ('')

 %                             Problema 2
% Utilizar el método de euler para obtener una aproximaciónde la siguiente 
% ecuación diferenciales f(x)= x.^4 + 4*x.^3 - 10*x.^2 + 5 *x+ 6, la
% ecuación se evaluará en el intervalo [0,6] con una condicion inicial de f(0)=1.
disp('Problema 2')
try
 funcion = @(x) x.^4 + 4*x.^3 - 10*x.^2 + 5 *x+ 6;
 intervalo = [0 , 6];
 condicionInicial = 2;
 iteraciones = 100;
 orden = 4;
 [valor, error, estabilidad] = metodo_Euler(funcion, intervalo, condicionInicial, iteraciones, orden);
   disp('El valor aproximado es:')
  disp(valor)
  disp ('')
  disp('El error estimado es:')
  disp(error)
  disp('')
  disp(estabilidad)
 catch err
  fprintf('Error: %s\n',err.message);
end