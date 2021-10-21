%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 20/10/2021
%Descripción : El programa tiene la finalidad de resolver
%                                 sistemas de ecuaciones lineales por el 
%                                 método de eliminación de Gauss


A = [1, 2, 1 ; 2, 3, -1 ; 3, -1, 1];
b = [8;5;4];
try
  [A_escalonada, solucion]=gauss(A, b);
  disp("La matriz  escalonada es:   ");
  disp(A_escalonada);
  
  disp("Los resultados son; ");
  for i=1:length(solucion);
    textoResultado = strcat("x", mat2str(i), " = ", mat2str(solucion(i)));
    disp(textoResultado)
  endfor
  
  
catch err
  fprintf('Error: %s\n',err.message);
end