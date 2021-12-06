%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 6/12/2021
%Descripción : El programa tiene la finalidad de calcular
%              integrales impropias

clc
clear
pkg load symbolic


%          Problema 1
% Analice la convergencia o divergencia de 
% y = x.*exp(x.^3) en el intervalo [-infty, -5]
disp('Problema 1')
try
 funcion = @(x) x.*exp(x.^3);
intervalo = [-inf, -5];
[valor, error] = integral_Impropia(funcion, intervalo);
disp('El valor aproximado de la integral es:')
disp(valor)
disp('El error estimado es:')
disp(error)
disp('')
disp('')
catch err
  fprintf('Error: %s\n',err.message);
end

%          Problema 2
% Analice la convergencia o divergencia de 
% y = sin(exp(x/2)) en el intervalo [-infty, -1]
disp('Problema 2')
try
funcion = @(x) sin(exp(x/2));
intervalo = [-inf, -1];
[valor, error] = integral_Impropia(funcion, intervalo);
disp('El valor aproximado de la integral es:')
disp(valor)
disp('El error estimado es:')
disp(error)
catch err
  fprintf('Error: %s\n',err.message);
end