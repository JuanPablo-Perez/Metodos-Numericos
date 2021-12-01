%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 30/11/2021
%Descripción : El programa tiene la finalidad de calcular
%              la integral de una función mediante la regla
%              del trapecio.
clc
clear
pkg load symbolic
warning('off','all');

disp ("Problema 1")
%                             Problema 1
% Utilizar la regla del trapecio para obtener una aproximación de la integral
% definida siguiente f(x)= sqrt(1+x.^2), la integral se evaluará en el intervalo
% [2,3] con un n=6.

funcion  = @(x) sqrt(1+x.^2);
intervalo = [2, 3];
n = 6;
[valor, error, datosGrafica] = integralTrapecio(funcion, intervalo, n);
disp('El valor aproximado de la integral es:')
disp(valor)
disp('El error estimado es:')
disp(error)
figura1 = figure(1);
t = linspace(intervalo(1), intervalo(2), 100);
fa  = funcion(intervalo(1));
fb = funcion(intervalo(2));
X = datosGrafica(:, 1)';
Y= datosGrafica(:, 2)';

hold on 
grid on
figura1 = figure(1);
surf([X;X],  [Y; 0*Y], 0*[X; X]);
plot(t, funcion(t), 'r');
view(0, 90) ;

disp ("Problema 2")
%                             Problema 2
% Utilizar la regla del trapecio para obtener una aproximación de la integral
% definida siguiente f(x)= 170/1+x.^2, la integral se evaluará en el intervalo
% [-2,4] con un 2n=12.
funcion  = @(x) 170 ./(1+x.^2);
intervalo = [-2, 4];
n = 6;
[valor, error, datosGrafica] = integralTrapecio(funcion, intervalo, n);
disp('El valor aproximado de la integral es:')
disp(valor)
disp('El error estimado es:')
disp(error)
figura2 = figure(2);
t = linspace(intervalo(1), intervalo(2), 100);
fa  = funcion(intervalo(1));
fb = funcion(intervalo(2));
X = datosGrafica(:, 1)';
Y= datosGrafica(:, 2)';

hold on 
grid on
surf([X;X],  [Y; 0*Y], 0*[X; X]);
plot(t, funcion(t), 'r');
view(0, 90) ;