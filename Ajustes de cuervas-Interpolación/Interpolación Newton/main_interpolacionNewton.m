%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 11/11/2021
%Descripción : El programa tiene la finalidad de aproximar
%                                 un valor mediante a interpolación polinomial
%                                 de Newton


%                  Problema 1
% Encuentra la ecuación que más se ajuste a los puntos
% (2.5, 13) ; (3.5, 11) ; (5, 8.5) ; (6, 8.2) ; (7.5, 7)
%  (10, 6.2) ; (12.5, 5.2) ; (15, 4.8) ; (17.5, 4.6) ; (20, 4.3) ; 
warning('off','all');
disp("Problema 1")
x = [1, 4, 6, 5, 3, 1.5, 2.5, 3.5];
y = [0, 1.3862944, 1.7917595, 1.6094379, 1.0986123, 0.4054641, 0.9162907, 1.2527630];
xi = 2;
[ecuacion, valor,Y,X]= interpolacionNewton(x,y, xi);
disp("La  ecuacion es :")
disp(ecuacion)
disp('')
disp('El valor es:')
disp(valor)
%Gráfico problema 1
figura1 = figure(1);
grid on
hold on 
plot(X, Y, "r");
plot(x, y, 'o')



%                  Problema 2
% Encuentra la ecuación que más se ajuste a los puntos
% (2, -15) ; (-3, 15) ; (5, -153) ; (-7, 291)

disp("\n\n Problema 2")
x = [2, -3, 5, -7];
y = [-15, 15, -153, 291];
xi = -4;
[ecuacion, valor,Y,X]= interpolacionNewton(x,y, xi);
disp("La  ecuacion es :")
disp(ecuacion)
disp('')
disp('El valor es:')
disp(valor)
%Gráfico problema 2
figura2 = figure(2);
grid on
hold on
plot(X, Y, "r");
plot(x, y, 'o')
