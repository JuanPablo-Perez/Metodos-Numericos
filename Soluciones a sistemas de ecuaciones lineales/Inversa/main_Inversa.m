  %Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 29/10/2021
%Descripción : El programa tiene la finalidad de encontrar 
%                                la inversa de una matriz
%                                 

  
  %                  INVERSA 1 
  try
  A = [6, 15, 55; 15, 55, 225; 55, 225, 979]
  inversaA = inversa(A)
 catch err
  fprintf('Error: %s\n',err.message);
end

  %                  INVERSA 2
 try
  B = [8,20,15; 20, 80, 50; 15, 50, 60]
  inversaB =inversa(B)
catch err
  fprintf('Error: %s\n',err.message);
end