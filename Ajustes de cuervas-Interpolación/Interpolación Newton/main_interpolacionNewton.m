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

x = [1, 4, 6, 5, 3, 1.5, 2.5, 3.5];
y = [0, 1.3862944, 1.7917595, 1.6094379, 1.0986123, 0.4054641, 0.9162907, 1.2527630];
xi = 2;
[ecuacion, valor]= interpolacionNewton(x,y, xi, 2);
disp("La  ecuacion es :")
disp(ecuacion)
disp('')
disp('El valor es:')
disp(valor)