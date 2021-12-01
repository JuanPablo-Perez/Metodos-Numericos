%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 30/11/2021
%Descripción : El programa tiene la finalidad de calcular
%              la integral de una función mediante la regla
%              de Simpson tanto de 1/3 como de 3/8.



clc
clear
disp ("Problema 1")
%                             Problema 1
% Utilizar la regla de Simpson 1/3 para obtener una aproximación de la integral
% definida siguiente f(x)= sen(x.^2), la integral se evaluará en el intervalo
% [0,1.5] con un n=8.

funcion  = @(x) sin(x.^2);
intervalo = [0, 1.5];
n = 8;
[valor, error, datosGrafica] = reglaSimpson13(funcion, intervalo, n);
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
surf([X;X],  [Y; 0*Y], 0*[X; X]);
plot(t, funcion(t), 'r');
view(0, 90) ;



disp ("Problema 2")
%                             Problema 2
% Utilizar la regla de Simpson 3/8 para obtener una aproximación de la integral
% definida siguiente f(x)= e^x ln(x), la integral se evaluará en el intervalo
% [1,4] con un n=12.
funcion  = @(x) exp(x).*log(x);
intervalo = [1, 4];
n = 12;
[valor, error, datosGrafica] = reglaSimpson38(funcion, intervalo, n);
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



