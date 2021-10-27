%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 27/10/2021
%Descripción : El programa tiene la finalidad de resolver
%                                 sistemas de ecuaciones lineales por el 
%                                 método de eliminación de Gauss con pivotacion


%                   Problema 1
% Encuentre las corrientes i1, i2, i3, i4, Si lsego de realizar el 
% análisis obtenemos el sistema de ecuaciones:
%   7i1   -  2i2   +    0     +      0 = 8
% -2i1   +  6i2   -  4i3  +      0 =  4
%     0     -  4i2  +   5i3  -     i4  = - 10
%     0     +     0    -    i3    +  5i4 = -4

fprintf("Problema 1:")
A=[7,-2,0,0;-2,6,-4,0;0,-4,5,-1;0,0,-1,5];
b = [8;4;-10;-4];

try
  [A_escalonada, solucion]=gaussp(A, b);
  disp("\nLa matriz  escalonada es:   ");
  disp(A_escalonada);
  
  disp("\nLos resultados son; ");
  for i=1:length(solucion);
    textoResultado = strcat("x", mat2str(i), " = ", mat2str(solucion(i)));
    disp(textoResultado)
  endfor
  
  
catch err
  fprintf('Error: %s\n',err.message);
end

%                  Problema 2
%Halle el potencial en a,b,c,d si luego de realizar el análisis
%nodal tenemos el siguiente sistema de ecuaciones:
%   -7a   +   2b  +    0     + 4d  = -60 
%       a    -   4b  +   2c   +   0   = -90 
%      0     -   5b  +  11c  -  2d  =  0   
%     5a   +     0   +   2c   -  8d  = 300

fprintf("\n\nProblema 2:")
A=[-7,2,0,4;1,-4,2,0;0,-5,11,-2;5,0,5,-8];
b = [-60;-90;0;300];

try
  [A_escalonada, solucion]=gaussp(A, b);
  disp("\nLa matriz  escalonada es:   ");
  disp(A_escalonada);
  
  disp("\nLos resultados son; ");
  for i=1:length(solucion);
    textoResultado = strcat("x", mat2str(i), " = ", mat2str(solucion(i)));
    disp(textoResultado)
  endfor
  
  
catch err
  fprintf('Error: %s\n',err.message);
end