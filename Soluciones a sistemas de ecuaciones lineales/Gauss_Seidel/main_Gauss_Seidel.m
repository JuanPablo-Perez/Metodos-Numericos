%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 29/10/2021
%Descripción : El programa tiene la finalidad de resolver
%                                 sistemas de ecuaciones lineales por el 
%                                 método iterativo de Gauss-Seidel


%                  Problema 1
%Halle el potencial en a,b,c,d si luego de realizar el análisis
%nodal tenemos el siguiente sistema de ecuaciones:
%   -7a   +   2b  +    0     + 4d  = -60 
%       a    -   4b  +   2c   +   0   = -90 
%      0     -   5b  +  11c  -  2d  =  0   
%     5a   +     0   +   2c   -  8d  = 300 
A= [-7, 2, 0, 4;  1, -4, 2, 0; 0, -5, 11, -2; 5, 0, 2, -8];
b = [-60; -90; 0; 300];
disp("PROBLEMA 1")
try
  [solucion , iteraciones]= gauss_seidel(A,b);
  disp(strcat('El vector solucion obtenido luego de ', mat2str(iteraciones), ' iteraciones es: '))
  disp(solucion)
catch err
  fprintf('Error: %s\n',err.message);
end




%                   Problema 2
% Encuentre las corrientes i1, i2, i3, i4, Si lsego de realizar el 
% análisis obtenemos el sistema de ecuaciones:
%   7i1   -  2i2   +    0     +      0 = 8
% -2i1   +  6i2   -  4i3  +      0 =  4
%     0     -  4i2  +   5i3  -     i4  = - 10
%     0     +     0    -    i3    +  5i4 = -4
A= [7, -2, 0, 0;  -2, 6, -4, 0; 0, -4, 5, -1; 0, 0, -1, 5];
b = [8 ;4 ;-10; -4];
disp('')
disp("PROBLEMA 2")
try
  [solucion , iteraciones]= gauss_seidel(A,b);
  disp(strcat('El vector solucion obtenido luego de ', mat2str(iteraciones), ' iteraciones es: '))
  disp(solucion)
catch err
  fprintf('Error: %s\n',err.message);
end
